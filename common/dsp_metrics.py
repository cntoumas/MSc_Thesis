#!/usr/bin/env python3
"""
common/dsp_metrics.py — single source of truth for DSP figures of merit
=======================================================================
Shared by both verification scripts (serial + parallel MDF) and the
cross-architecture co-simulation so that every PNG / CSV uses *identical*
math. Operates on a **natural-order, BFP-scaled complex spectrum** ``X[k]``.

Single-tone metrics (SFDR / THD / SINAD / ENOB) use the coherent, no-window
convention (the Sine test sits on bin ``k0=50`` of ``N=1024``). Reference-based
variants (``*_ref``) score each metric against the double-precision golden
output and stay well defined when the parallel core's block-floating-point
read-back rounds the narrowband floor below its LSB. Phase error is
scale-invariant and so immune to the BFP exponent.
"""
import numpy as np

SQNR_CAP_DB = 120.0
DB_CAP = 120.0
_POWER_FLOOR = 1e-20


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
def _power(X):
    return np.abs(np.asarray(X, dtype=complex)) ** 2


def _band_indices(N):
    return np.arange(1, N // 2)


def fold(m, N):
    m = m % N
    return min(m, N - m)


# ---------------------------------------------------------------------------
# SQNR
# ---------------------------------------------------------------------------
def compute_sqnr(ref, hw):
    """Signal-to-Quantization-Noise Ratio in dB (time- or freq-domain)."""
    ref = np.asarray(ref, dtype=complex)
    hw = np.asarray(hw, dtype=complex)
    n = min(len(ref), len(hw))
    if n == 0:
        return -np.inf
    ref_t = ref[:n]
    hw_t = hw[:n]
    signal_power = np.mean(np.abs(ref_t) ** 2)
    noise = ref_t - hw_t
    noise_power = np.mean(np.abs(noise) ** 2)
    if noise_power < _POWER_FLOOR:
        return SQNR_CAP_DB
    if signal_power < _POWER_FLOOR:
        return 0.0
    return 10.0 * np.log10(signal_power / noise_power)


# ---------------------------------------------------------------------------
# Single-tone band metrics (self-spectral: read from the DUT's own output)
# ---------------------------------------------------------------------------
def compute_sfdr(X, k0):
    """Spurious-Free Dynamic Range in dBc (self-spectral)."""
    X = np.asarray(X, dtype=complex)
    N = len(X)
    P = _power(X)
    band = _band_indices(N)
    band = band[band != k0]
    if band.size == 0:
        return DB_CAP
    p_fund = max(P[k0], _POWER_FLOOR)
    p_spur = np.max(P[band])
    if p_spur < _POWER_FLOOR:
        return DB_CAP
    return 10.0 * np.log10(p_fund / p_spur)


def compute_thd(X, k0, n_harm=5):
    """Total Harmonic Distortion (self-spectral). Returns (thd_dB, thd_percent)."""
    X = np.asarray(X, dtype=complex)
    N = len(X)
    P = _power(X)
    nyq = N // 2
    p_fund = max(P[k0], _POWER_FLOOR)
    seen = set()
    p_harm = 0.0
    for h in range(2, n_harm + 1):
        hk = fold(h * k0, N)
        if hk in (0, k0, nyq) or hk in seen:
            continue
        seen.add(hk)
        p_harm += P[hk]
    if p_harm < _POWER_FLOOR:
        return -DB_CAP, 0.0
    ratio = p_harm / p_fund
    return 10.0 * np.log10(ratio), 100.0 * np.sqrt(ratio)


def compute_sinad(X, k0):
    """Signal-to-Noise-And-Distortion ratio in dB (self-spectral)."""
    X = np.asarray(X, dtype=complex)
    N = len(X)
    P = _power(X)
    band = _band_indices(N)
    band = band[band != k0]
    p_fund = max(P[k0], _POWER_FLOOR)
    p_nd = np.sum(P[band])
    if p_nd < _POWER_FLOOR:
        return DB_CAP
    return 10.0 * np.log10(p_fund / p_nd)


def compute_enob(sinad_db):
    """Effective Number Of Bits from SINAD (dB): (SINAD - 1.76) / 6.02."""
    return (sinad_db - 1.76) / 6.02


# ---------------------------------------------------------------------------
# Reference-based single-tone metrics (robust to the BFP read-back floor)
# ---------------------------------------------------------------------------
# The self-spectral figures above read the noise floor out of the DUT's own
# output spectrum. For the parallel core, the fixed block-exponent normalises
# each block to its single large fundamental, so on a coherent tone every other
# bin falls below the integer read-back LSB and rounds to exactly zero; the
# self-spectral SFDR/THD/SINAD then have no floor to read and saturate the
# numerical guard. Scoring the same definitions against the double-precision
# golden output keeps a well-defined floor (the deviation from the ideal
# transform) and yields finite figures for both cores.

def _alpha_fit(ref, hw):
    """Optimal complex gain a minimising ||hw - a*ref||^2 (projection)."""
    ref = np.asarray(ref, dtype=complex)
    hw = np.asarray(hw, dtype=complex)
    denom = np.vdot(ref, ref)
    if abs(denom) < _POWER_FLOOR:
        return 0.0 + 0.0j
    return np.vdot(ref, hw) / denom


def compute_sinad_ref(ref, hw):
    """SINAD referenced to the golden output (dB) = optimal-alpha SQNR."""
    ref = np.asarray(ref, dtype=complex)
    hw = np.asarray(hw, dtype=complex)
    a = _alpha_fit(ref, hw)
    sig = np.sum(np.abs(a * ref) ** 2)
    err = np.sum(np.abs(hw - a * ref) ** 2)
    if err < _POWER_FLOOR:
        return SQNR_CAP_DB
    if sig < _POWER_FLOOR:
        return 0.0
    return 10.0 * np.log10(sig / err)


def compute_enob_ref(ref, hw):
    """ENOB from the reference-based SINAD: (SINAD_ref - 1.76) / 6.02."""
    return compute_enob(compute_sinad_ref(ref, hw))


def spurs_observable(hw, k0, rel_floor=1e-9):
    """True if any in-band non-fundamental bin rises above the read-back floor."""
    hw = np.asarray(hw, dtype=complex)
    N = len(hw)
    P = _power(hw)
    band = _band_indices(N)
    band = band[band != k0]
    if band.size == 0:
        return False
    p_fund = max(P[k0], _POWER_FLOOR)
    return bool(np.max(P[band]) > rel_floor * p_fund)


def compute_sfdr_ref(ref, hw, k0):
    """Reference-referred SFDR in dBc, from the residual error spectrum.

    SFDR_ref = 10*log10( P_fund / max_{k != k0} |hw[k] - a*ref[k]|^2 ).
    Stays finite for the parallel core because the residual against the golden
    output carries the deviation from the ideal even where hw rounds to zero.
    """
    ref = np.asarray(ref, dtype=complex)
    hw = np.asarray(hw, dtype=complex)
    N = len(hw)
    a = _alpha_fit(ref, hw)
    E = hw - a * ref
    P = _power(a * ref)
    Pe = _power(E)
    band = _band_indices(N)
    band = band[band != k0]
    if band.size == 0:
        return DB_CAP
    p_fund = max(P[k0], _POWER_FLOOR)
    p_spur = np.max(Pe[band])
    if p_spur < _POWER_FLOOR:
        return DB_CAP
    return 10.0 * np.log10(p_fund / p_spur)


def compute_thd_ref(ref, hw, k0, n_harm=5):
    """Reference-referred THD in dB, from the residual error spectrum.

    THD_ref = 10*log10( sum_h |hw[h] - a*ref[h]|^2 / P_fund ) over harmonics
    h = 2..n_harm of k0. Well-defined even when the DUT's harmonic bins round
    below the read-back LSB.
    """
    ref = np.asarray(ref, dtype=complex)
    hw = np.asarray(hw, dtype=complex)
    N = len(hw)
    nyq = N // 2
    a = _alpha_fit(ref, hw)
    E = hw - a * ref
    P = _power(a * ref)
    Pe = _power(E)
    p_fund = max(P[k0], _POWER_FLOOR)
    seen = set()
    p_harm = 0.0
    for h in range(2, n_harm + 1):
        hk = fold(h * k0, N)
        if hk in (0, k0, nyq) or hk in seen:
            continue
        seen.add(hk)
        p_harm += Pe[hk]
    if p_harm < _POWER_FLOOR:
        return -DB_CAP
    return 10.0 * np.log10(p_harm / p_fund)


# ---------------------------------------------------------------------------
# Phase error (scale-invariant — the cleanest cross-arch precision metric)
# ---------------------------------------------------------------------------
def _wrap(rad):
    return (rad + np.pi) % (2.0 * np.pi) - np.pi


def compute_phase_error(ref, hw, mag_thresh_rel=1e-3, detrend=True):
    """Per-bin phase error wrap(angle(hw) - angle(ref)) on significant bins."""
    ref = np.asarray(ref, dtype=complex)
    hw = np.asarray(hw, dtype=complex)
    n = min(len(ref), len(hw))
    ref = ref[:n]
    hw = hw[:n]

    per_bin = np.full(n, np.nan)
    mag = np.abs(ref)
    max_mag = np.max(mag) if n else 0.0
    mask = mag > (mag_thresh_rel * max_mag) if max_mag > 0 else np.zeros(n, dtype=bool)

    idx = np.nonzero(mask)[0]
    if idx.size == 0:
        return {
            "per_bin": per_bin, "mask": mask, "idx": idx,
            "max_deg": float("nan"), "rms_deg": float("nan"),
            "rms_deg_detrended": float("nan"), "slope_rad_per_bin": 0.0,
        }

    err = _wrap(np.angle(hw[idx]) - np.angle(ref[idx]))
    per_bin[idx] = err

    err_deg = np.degrees(err)
    max_deg = float(np.max(np.abs(err_deg)))
    rms_deg = float(np.sqrt(np.mean(err_deg ** 2)))

    slope = 0.0
    rms_deg_detrended = rms_deg
    if detrend and idx.size >= 2:
        unwrapped = np.unwrap(err)
        A = np.vstack([idx.astype(float), np.ones(idx.size)]).T
        (slope, intercept), *_ = np.linalg.lstsq(A, unwrapped, rcond=None)
        residual = unwrapped - (slope * idx + intercept)
        res_deg = np.degrees(_wrap(residual))
        rms_deg_detrended = float(np.sqrt(np.mean(res_deg ** 2)))

    return {
        "per_bin": per_bin, "mask": mask, "idx": idx,
        "max_deg": max_deg, "rms_deg": rms_deg,
        "rms_deg_detrended": rms_deg_detrended,
        "slope_rad_per_bin": float(slope),
    }


# ---------------------------------------------------------------------------
# Convenience wrapper
# ---------------------------------------------------------------------------
def tone_metrics(ref, hw, k0, n_harm=5, single_tone=True):
    """All figures of merit for one test case (flat dict for CSV / plotting)."""
    sqnr = compute_sqnr(ref, hw)
    phase = compute_phase_error(ref, hw)

    out = {
        "k0": k0,
        "single_tone": single_tone,
        "sqnr_db": sqnr,
        "sfdr_dbc": float("nan"),
        "thd_db": float("nan"),
        "thd_pct": float("nan"),
        "sinad_db": float("nan"),
        "enob_bits": float("nan"),
        # reference-based (robust to the BFP read-back floor)
        "sinad_ref_db": float("nan"),
        "enob_ref_bits": float("nan"),
        "sfdr_ref_dbc": float("nan"),
        "thd_ref_db": float("nan"),
        "spurs_observable": None,
        "phase_max_deg": phase["max_deg"],
        "phase_rms_deg": phase["rms_deg"],
        "phase_rms_deg_detrended": phase["rms_deg_detrended"],
        "phase": phase,
    }

    if single_tone and k0 is not None:
        out["sinad_ref_db"] = compute_sinad_ref(ref, hw)
        out["enob_ref_bits"] = compute_enob_ref(ref, hw)
        out["sfdr_ref_dbc"] = compute_sfdr_ref(ref, hw, k0)
        out["thd_ref_db"] = compute_thd_ref(ref, hw, k0, n_harm=n_harm)

        observable = spurs_observable(hw, k0)
        out["spurs_observable"] = observable
        if observable:
            out["sfdr_dbc"] = compute_sfdr(hw, k0)
            thd_db, thd_pct = compute_thd(hw, k0, n_harm=n_harm)
            out["thd_db"] = thd_db
            out["thd_pct"] = thd_pct
            out["sinad_db"] = compute_sinad(hw, k0)
            out["enob_bits"] = compute_enob(out["sinad_db"])

    return out
