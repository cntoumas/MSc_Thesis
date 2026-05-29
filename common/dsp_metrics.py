#!/usr/bin/env python3
"""
common/dsp_metrics.py — single source of truth for DSP figures of merit
=======================================================================
Shared by both verification scripts (serial + parallel MDF) and the
cross-architecture co-simulation so that every PNG / CSV uses *identical*
math. Operates on a **natural-order, BFP-scaled complex spectrum** ``X[k]``
(the form both verify scripts already build via ``reconstruct_hw_fft`` /
``unbit_reverse_fft``).

Conventions baked in here (per the thesis verification plan):
  * Single-tone metrics (SFDR / THD / SINAD / ENOB) use the **coherent,
    no-window** convention: the existing Sine test sits exactly on bin
    ``k0=50`` of ``N=1024`` so the fundamental is a single bin — no spectral
    leakage, no window needed.
  * SFDR / ENOB / THD are **single-tone** metrics — only meaningful for the
    Sine case. Impulse / DC / MultiTone / Chirp report SQNR + phase error
    only; the single-tone metrics are reported as N/A (NaN) for those.
  * All band metrics are **single-sided** over bins ``1 .. N/2-1`` (DC and
    Nyquist excluded).
  * Both spectra must be in **natural order** before comparison (serial path
    calls ``unbit_reverse_fft``; parallel uses the stride mapping in
    ``reconstruct_hw_fft``).
  * Guards against ``log10(0)``: tiny powers are floored and perfect results
    are capped (mirrors the existing 120 dB SQNR cap used in both scripts).

Phase error is **scale-invariant** — inherently robust to the block-floating
point (BFP) exponent — making per-bin phase the cleanest cross-architecture
precision metric.
"""
import numpy as np

# Caps / floors that mirror the existing convention in the verify scripts.
SQNR_CAP_DB = 120.0      # "effectively perfect" reconstruction
DB_CAP = 120.0           # cap for SFDR / |THD| when distortion floor is ~0
_POWER_FLOOR = 1e-20     # floor for power ratios to avoid log10(0)


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
def _power(X):
    """Per-bin power |X[k]|^2 as a float64 array."""
    return np.abs(np.asarray(X, dtype=complex)) ** 2


def _band_indices(N):
    """Single-sided analysis band: bins 1 .. N/2-1 (DC and Nyquist excluded)."""
    return np.arange(1, N // 2)


def fold(m, N):
    """Fold an aliased bin index into the single-sided band [0, N/2].

    A harmonic landing above Nyquist aliases back: fold(m) = min(m, N-m).
    """
    m = m % N
    return min(m, N - m)


# ---------------------------------------------------------------------------
# SQNR (moved here unchanged from the verify scripts)
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
        return SQNR_CAP_DB  # effectively perfect
    if signal_power < _POWER_FLOOR:
        return 0.0
    return 10.0 * np.log10(signal_power / noise_power)


# ---------------------------------------------------------------------------
# Single-tone band metrics
# ---------------------------------------------------------------------------
def compute_sfdr(X, k0):
    """Spurious-Free Dynamic Range in dBc.

    SFDR = 10*log10( P[k0] / max(P[k] for k in band, k != k0) ).
    Band = bins 1 .. N/2-1, excluding the fundamental bin k0.
    """
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
    """Total Harmonic Distortion. Returns (thd_dB, thd_percent).

    Harmonic bins = fold((h*k0) mod N) for h = 2 .. n_harm. Harmonics landing
    on DC / k0 / Nyquist are skipped.
        THD_dB  = 10*log10( sum(P_harm) / P[k0] )
        percent = 100 * sqrt( sum(P_harm) / P[k0] )
    """
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
    thd_db = 10.0 * np.log10(ratio)
    thd_pct = 100.0 * np.sqrt(ratio)
    return thd_db, thd_pct


def compute_sinad(X, k0):
    """Signal-to-Noise-And-Distortion ratio in dB.

    SINAD = 10*log10( P[k0] / sum(P[k] for k in band, k != k0) ), i.e. the
    fundamental over *all* other in-band content (noise + distortion).
    """
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
# Phase error (scale-invariant — the cleanest cross-arch precision metric)
# ---------------------------------------------------------------------------
def _wrap(rad):
    """Wrap radians to (-pi, pi]."""
    return (rad + np.pi) % (2.0 * np.pi) - np.pi


def compute_phase_error(ref, hw, mag_thresh_rel=1e-3, detrend=True):
    """Per-bin phase error wrap(angle(hw) - angle(ref)).

    Evaluated only where |ref[k]| > mag_thresh_rel * max|ref| (bins with
    negligible reference magnitude have meaningless phase). Optionally removes
    a best-fit linear phase ramp (group delay from the fixed pipeline latency /
    bit-reversal reordering) and reports both raw and detrended RMS.

    Returns dict: {per_bin, mask, idx, max_deg, rms_deg, rms_deg_detrended,
                   slope_rad_per_bin}.
    Phase error is scale-invariant, so the BFP exponent cancels out.
    """
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

    # Best-fit linear phase ramp (group delay). Fit on unwrapped residual so a
    # constant slope across active bins is removed before reporting RMS.
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
    """All figures of merit for one test case.

    ``ref`` / ``hw`` are natural-order complex spectra. ``k0`` is the
    fundamental bin (only used when ``single_tone`` is True). For non-single-
    tone cases (Impulse / DC / MultiTone / Chirp) set ``single_tone=False`` —
    SFDR / THD / SINAD / ENOB come back as NaN (N/A) while SQNR + phase error
    are still computed.

    Returns a flat dict suitable for CSV rows and plotting.
    """
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
        "phase_max_deg": phase["max_deg"],
        "phase_rms_deg": phase["rms_deg"],
        "phase_rms_deg_detrended": phase["rms_deg_detrended"],
        "phase": phase,
    }

    if single_tone and k0 is not None:
        out["sfdr_dbc"] = compute_sfdr(hw, k0)
        thd_db, thd_pct = compute_thd(hw, k0, n_harm=n_harm)
        out["thd_db"] = thd_db
        out["thd_pct"] = thd_pct
        sinad = compute_sinad(hw, k0)
        out["sinad_db"] = sinad
        out["enob_bits"] = compute_enob(sinad)

    return out
