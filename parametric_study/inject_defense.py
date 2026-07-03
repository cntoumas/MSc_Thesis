#!/usr/bin/env python3
"""
inject_defense.py — Append a 'Parametric Sweep Study' section to
Thesis_Defense_Summary.docx by editing word/document.xml directly (python-docx
/ lxml won't build on this Python). Matches the document's existing Heading1 /
Heading3 / body paragraph styles. Idempotent: refuses to double-insert.
"""
import zipfile
import shutil
from pathlib import Path

DOC = Path(__file__).resolve().parent.parent / "Thesis_Defense_Summary.docx"
MARK = "Parametric Sweep Study"


def esc(s):
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def h1(t):
    return f'<w:p><w:pPr><w:pStyle w:val="Heading1"/></w:pPr><w:r><w:t xml:space="preserve">{esc(t)}</w:t></w:r></w:p>'


def h3(t):
    return f'<w:p><w:pPr><w:pStyle w:val="Heading3"/></w:pPr><w:r><w:t xml:space="preserve">{esc(t)}</w:t></w:r></w:p>'


def body(t):
    return f'<w:p><w:r><w:t xml:space="preserve">{esc(t)}</w:t></w:r></w:p>'


def bold(t):
    return (f'<w:p><w:r><w:rPr><w:b/><w:bCs/></w:rPr>'
            f'<w:t xml:space="preserve">{esc(t)}</w:t></w:r></w:p>')


def qa(q, a):
    return (f'<w:p><w:r><w:rPr><w:b/><w:bCs/></w:rPr>'
            f'<w:t xml:space="preserve">{esc("Q: " + q)}</w:t></w:r></w:p>'
            f'<w:p><w:r><w:t xml:space="preserve">{esc("A: " + a)}</w:t></w:r></w:p>')


def build_section():
    p = []
    p.append(h1("10. Parametric Sweep Study (size / precision / cost scaling)"))
    p.append(body(
        "Beyond the fixed 1024-point / 16-bit-data / 16-bit-twiddle design point, "
        "both cores were swept over FFT size N (512-4096), data-path width (8-64 "
        "bits) and twiddle width (8-32 bits) to characterise the trade-offs and to "
        "test how parametric each architecture really is. Every configuration was "
        "simulated through the same Icarus Verilog flow and the same shared DSP "
        "metrics module used elsewhere in this thesis; at the baseline config each "
        "design reproduces its published numbers exactly (Serial Sine 72.41 dB, "
        "Parallel Sine 73.48 dB, Parallel Chirp 34.95 dB), which validates the "
        "harness. Full data and scripts live under results/parametric_sweep/ and "
        "parametric_study/."))

    p.append(h3("10.1 How parametric each design actually is"))
    p.append(body(
        "Serial FFT: genuinely size-parametric. The AGU, RAM, butterfly, BFP and "
        "ROM modules were already clean in N and width; the only change needed was "
        "to decouple the twiddle width from the data width (a new TWIDDLE_WIDTH "
        "parameter). It then sweeps N and both widths directly."))
    p.append(body(
        "Parallel MDF FFT: not size-parametric despite its parameters. The "
        "top level was hand-wired for N=1024 - it instantiates ten stages with "
        "hand-derived pipeline delay taps, a 287-bit valid shift register and a "
        "fixed divide-by-2^10 block exponent. Sweeping N required generating an "
        "N-specialised top (stage count, taps, pipe width and exponent computed in "
        "Python) that reuses the unmodified stage RTL; for N=1024 it reproduces the "
        "original taps bit-for-bit. Defense point: a streaming MDF pipeline is easy "
        "to make numerically parametric but hard to make structurally parametric, "
        "because its control is a set of N-specific delay constants; the "
        "time-multiplexed Serial core generalises across N for free."))

    p.append(h3("10.2 Precision law: SQNR is governed by min(data, twiddle), ~6 dB per bit"))
    p.append(body(
        "Twiddle width is the dominant accuracy knob on BOTH designs at about 6.5 "
        "dB of SQNR per bit (Serial Sine 32/56/72 dB at 8/12/16-bit twiddles; "
        "Parallel 34/60/73 dB). But it only helps if the data path can carry it: "
        "with a 16-bit data path, twiddles wider than 16 bits add nothing (Serial "
        "flat ~71 dB, Parallel flat 73.5 dB) because the data quantisation floor "
        "then dominates. Symmetrically, with 16-bit twiddles a wider data path "
        "saturates at ~79.5 dB (Serial) / ~82 dB (Parallel)."))
    p.append(body(
        "Holding the OTHER dimension wide removes the cap: at 32-bit data the "
        "twiddle sweep climbs to 168 dB (Serial) / 171 dB (Parallel) at 32-bit "
        "twiddles, and at 32-bit twiddles the data sweep climbs straight to 168 dB. "
        "Conclusion: SQNR is set by the SMALLER of {data width, twiddle width}, "
        "about 6 dB per bit of that limiting dimension - so the two must be scaled "
        "together; spending bits on only one is wasted."))
    p.append(body(
        "One notable consequence: widening the data path RESCUES the Parallel "
        "core's broadband (chirp) weakness - chirp SQNR goes from 34.95 dB at "
        "16-bit to 81.87 dB at 32-bit. The headline 'adaptive BFP beats fixed "
        "exponent by ~30 dB on chirp' is therefore true only at equal 16-bit width; "
        "the chirp gap is a scaling-policy/quantisation effect, not fundamental."))

    p.append(h3("10.3 Size (N) scaling"))
    p.append(body(
        "Serial: throughput falls from 21.4 to 16.6 MSPS over N=512..4096 "
        "(cycles grow as (N/2+10)*log2 N), and Sine SQNR drifts down only ~5 dB "
        "(73.6 to 68.2) thanks to adaptive BFP - no breakage at any N."))
    p.append(body(
        "Parallel: throughput stays flat at 400 MSPS (streaming) and the "
        "coherent-tone SQNR is completely flat at 73.5 dB for every N (a tone on a "
        "bin is scale-invariant under a fixed exponent). But broadband SQNR falls "
        "~3 dB per octave of N (chirp 38 to 29 dB), and the impulse UNDERFLOWS at "
        "N=4096 (the divide-by-2^12 fixed scaling rounds a flat low-amplitude "
        "spectrum to zero) - a genuine limitation of the fixed block exponent that "
        "the Serial adaptive BFP does not have."))

    p.append(h3("10.4 Cost ceiling - why width cannot be scaled freely"))
    p.append(body(
        "Multiplier (DSP) cost scales with the PRODUCT of the two widths, because a "
        "DSP48E1 is a 25x18 multiplier and wider operands must be tiled. Measured "
        "Yosys area of the Serial core (N=1024): 16/16 -> 3 DSP; 32/16 or 16/32 -> "
        "6 DSP; 32/32 -> 12 DSP; 64/16 -> 12 DSP. Logic grows ~linearly (LUT +78%, "
        "FF +70% at 32/32); data-path width drives BRAM, twiddle width drives the "
        "(cheap) ROM."))
    p.append(body(
        "The Parallel core makes this a hard wall: it has P=4 x 8 = 32 complex "
        "multipliers (vs the Serial core's one), so it already uses 160 of the "
        "240 DSP48 slices on the xc7a100t at 16/16. Widening to 32-bit roughly "
        "doubles-to-quadruples that (~320-640 DSP), so the high-precision Parallel "
        "configurations from 10.2 are physically unbuildable on the thesis FPGA. "
        "N also costs DSPs (140/160/180/200 at N=512/1024/2048/4096), so N=4096 "
        "alone is already ~83% of the DSP budget. The Serial core, with one "
        "multiplier, is nowhere near the DSP wall - its limit is BRAM/throughput."))

    p.append(h3("10.5 System ceiling - the ADC, not the arithmetic"))
    p.append(body(
        "The FFT is one block in analog -> ADC -> FFT -> result. The SQNR measured "
        "here is only the FFT's own fixed-point noise; the samples already carry "
        "the ADC's quantisation noise, which sets the real ceiling. An ideal N-bit "
        "ADC gives SNR = 6.02*N + 1.76 dB: 12-bit ~74 dB, 14-bit ~86 dB (real parts "
        "deliver fewer effective bits). Independent noise sources add in quadrature, "
        "so an FFT floor far below the ADC floor simply vanishes - to matter, the "
        "FFT SQNR must be within ~10 dB of the ADC's, not 90 dB below it."))
    p.append(body(
        "Tying it together: the 16/16 cores (~72-73 dB) sit right in the "
        "12-14-bit-ADC band, so they are appropriately sized. The 120-171 dB "
        "wide-precision configs make the FFT contribute essentially zero noise, but "
        "the delivered SNR is still capped at the ADC's ~74-86 dB - so the 4x DSP "
        "cost (and, for the Parallel core, exceeding the FPGA's DSP budget) buys "
        "precision the system never sees. This is the end-to-end justification for "
        "the 16-bit / 16-bit design point."))

    p.append(h3("10.6 Defense Q&A additions"))
    p.append(qa(
        "Why 16-bit data and 16-bit twiddles - why not wider for more accuracy?",
        "Two ceilings make wider pointless here. (1) SQNR is set by min(data, "
        "twiddle); at 16/16 that is ~72-73 dB. (2) The ADC feeding the FFT (a "
        "12-14-bit part) caps the chain at ~74-86 dB, and noise adds in quadrature, "
        "so a cleaner FFT is invisible end-to-end. Meanwhile DSP cost scales as "
        "data x twiddle - 32/32 needs 4x the multipliers, which the Parallel design "
        "cannot fit on the Artix-7. So 16/16 is the matched, buildable optimum."))
    p.append(qa(
        "Are your designs parametric in FFT size and word length?",
        "The Serial core is fully parametric in N and in data/twiddle width. The "
        "Parallel core's sub-modules are parametric, but its top level was wired for "
        "N=1024; I added an elaboration-time generator that emits the N-specialised "
        "top (stage count, pipeline taps, exponent), verified to reproduce the "
        "N=1024 design exactly and to work for N=512/2048/4096."))
    p.append(qa(
        "Your Parallel design loses ~30 dB to the Serial design on the chirp - is "
        "that a fundamental weakness of MDF?",
        "No - it is a consequence of the fixed divide-by-2 per stage scaling at "
        "16-bit, not of the MDF structure. Widening the data path to 32 bits "
        "recovers the chirp from 35 dB to 82 dB. Adaptive BFP wins on broadband "
        "signals at equal width; given enough data-path headroom the fixed-exponent "
        "design closes the gap."))
    return "".join(p)


def main():
    data = DOC.read_bytes()
    zin = zipfile.ZipFile(DOC)
    xml = zin.read("word/document.xml").decode("utf-8")
    if MARK in xml:
        print("Section already present - skipping (idempotent).")
        return

    idx = xml.find("End of defense summary")
    if idx == -1:
        # fall back: insert right before the closing sectPr
        anchor = xml.rfind("<w:sectPr")
    else:
        anchor = xml.rfind("<w:p>", 0, idx)
    assert anchor != -1, "insertion anchor not found"

    new_xml = xml[:anchor] + build_section() + xml[anchor:]

    tmp = DOC.with_suffix(".docx.tmp")
    with zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED) as zout:
        for item in zin.infolist():
            content = zin.read(item.filename)
            if item.filename == "word/document.xml":
                content = new_xml.encode("utf-8")
            zout.writestr(item, content)
    zin.close()
    shutil.move(str(tmp), str(DOC))
    print(f"Inserted Section 10 into {DOC.name}")


if __name__ == "__main__":
    main()
