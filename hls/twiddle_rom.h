#pragma once
#include <ap_int.h>
#include "twiddle_lut.h"

// ---------------------------------------------------------------------------
// twiddle_get(n, *w_re, *w_im)
//
// Returns W_1024^n = exp(-j*2*pi*n/1024) in Q1.15 fixed-point.
// Uses the same 1/8-cycle symmetry and 1's-complement negation as the
// Verilog twiddle_rom.v modules.  n must be in [0, 511].
//
// Storage: 129 entries (N/8+1), index 0..128 covers [0, pi/4].
// Octant decomposition (2 MSBs of 9-bit n):
//   oct 0  [0..pi/4]:    w_re = cos_val,  w_im = ~sin_val
//   oct 1  [pi/4..pi/2]: w_re = sin_val,  w_im = ~cos_val
//   oct 2  [pi/2..3pi/4]:w_re = ~sin_val, w_im = ~cos_val
//   oct 3  [3pi/4..pi]:  w_re = ~cos_val, w_im = ~sin_val
// ---------------------------------------------------------------------------
inline void twiddle_get(int n, short* w_re, short* w_im) {
#pragma HLS INLINE
    int octant  = (n >> 7) & 0x3;
    int offset  = n & 0x7F;
    int rom_addr = (octant & 1) ? (128 - offset) : offset;

    short cv = TW_COS_LUT[rom_addr];
    short sv = TW_SIN_LUT[rom_addr];

    switch (octant) {
        case 0:  *w_re =  cv; *w_im = (short)~sv; break;
        case 1:  *w_re =  sv; *w_im = (short)~cv; break;
        case 2:  *w_re = (short)~sv; *w_im = (short)~cv; break;
        default: *w_re = (short)~cv; *w_im = (short)~sv; break;
    }
}

// ---------------------------------------------------------------------------
// mdf_twiddle_get(addr, stage, path, *w_re, *w_im)
//
// MDF per-stage twiddle: n = (addr * P + path) << stage
// Mirrors the Verilog twiddle_rom.v for the parallel MDF design.
// addr  — delay-line read pointer (0..DEPTH-1)
// stage — feedback stage index (0..7)
// path  — parallel path index (0..P-1)
// ---------------------------------------------------------------------------
inline void mdf_twiddle_get(int addr, int stage, int path, short* w_re, short* w_im) {
#pragma HLS INLINE
    int n = ((addr * 4) + path) << stage;   // P=4 hardcoded
    twiddle_get(n, w_re, w_im);
}
