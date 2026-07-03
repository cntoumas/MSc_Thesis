#!/usr/bin/env python3
"""
inject_defense_p.py — Append subsection 10.7 (Parallelism P sweep) to
Thesis_Defense_Summary.docx, after the existing Section 10. Edits
word/document.xml directly (matches Heading3/body/Q&A styles). Idempotent.
"""
import zipfile
import shutil
from pathlib import Path

DOC = Path(__file__).resolve().parent.parent / "Thesis_Defense_Summary.docx"
MARK = "10.7 Parallelism"


def esc(s):
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def h3(t):
    return f'<w:p><w:pPr><w:pStyle w:val="Heading3"/></w:pPr><w:r><w:t xml:space="preserve">{esc(t)}</w:t></w:r></w:p>'


def body(t):
    return f'<w:p><w:r><w:t xml:space="preserve">{esc(t)}</w:t></w:r></w:p>'


def qa(q, a):
    return (f'<w:p><w:r><w:rPr><w:b/><w:bCs/></w:rPr>'
            f'<w:t xml:space="preserve">{esc("Q: " + q)}</w:t></w:r></w:p>'
            f'<w:p><w:r><w:t xml:space="preserve">{esc("A: " + a)}</w:t></w:r></w:p>')


def build():
    p = []
    p.append(h3("10.7 Parallelism (P) sweep"))
    p.append(body(
        "A final experiment swept the parallelism factor P of the Parallel MDF "
        "core. Two findings up front: P=6 and P=10 are impossible for a radix-2 "
        "MDF FFT (the delay-line depths N/(P*2^(s+1)) must be integers, and 1024 "
        "is not divisible by 6 or 10) - only powers of two that divide N are "
        "valid. And unlike the N sweep, changing P is a genuine "
        "micro-architecture change: the design factors N = (N/P) x P, so the "
        "feedback stages compute a within-path N/P-point FFT and the no-feedback "
        "(NF) stages compute a cross-path P-point FFT. At P=4 that NF block uses "
        "only trivial (x1, x-j) twiddles and needs no multipliers; at P=8 it "
        "becomes a 3-stage 8-point FFT that needs real W8 twiddles."))
    p.append(body(
        "P=8 was built and verified as a proof of concept (generalised twiddle "
        "ROMs, a generated P-point NF block, a generalised output bit-reversal, "
        "and a regenerated top). Result: SQNR was identical to P=4 (Impulse/DC "
        "120 dB, Sine 73.48 dB, MultiTone 68.22 dB) at exactly double the "
        "throughput (400 -> 800 MSPS). P is therefore a pure throughput-versus-area "
        "knob that leaves numerical precision untouched - precision is governed by "
        "N and word length, not by how many samples are processed per clock."))
    p.append(body(
        "Cost scales sub-linearly with throughput: feedback complex multipliers = "
        "P*(log2 N - log2 P), i.e. 32 at P=4 and 56 at P=8 (1.75x) for a 2x "
        "throughput gain, because higher P means fewer feedback stages - so larger "
        "P is slightly more multiplier-efficient per sample. The binding limit is "
        "the FPGA's DSP budget: P=4 uses ~96 (Yosys) / 160 (Vivado) DSP48 of 240 "
        "on the xc7a100t; P=8 roughly 168; P=16 would need ~288 and would not fit. "
        "On this device P=8 is the practical parallelism ceiling, and only if "
        "little else competes for DSP slices. (The final thesis design is kept at "
        "P=4 - the P=8 build was an exploratory generator output, not the "
        "deliverable.)"))
    p.append(qa(
        "Could you make the Parallel design faster by increasing P beyond 4?",
        "Yes, and I verified it: P=8 doubles throughput to 800 MSPS at identical "
        "precision. But P must be a power of two dividing N (P=6/10 are "
        "impossible), and the no-feedback stages stop being multiplier-free for "
        "P>4 (they need real W_P twiddles). The hard limit is DSPs - P=8 needs "
        "~168 of the 240 on the Artix-7 and P=16 would not fit - so P=4 is the "
        "balanced operating point for this device and P=8 the ceiling."))
    return "".join(p)


def main():
    zin = zipfile.ZipFile(DOC)
    xml = zin.read("word/document.xml").decode("utf-8")
    if MARK in xml:
        print("10.7 already present - skipping (idempotent).")
        return
    idx = xml.find("End of defense summary")
    anchor = xml.rfind("<w:p>", 0, idx) if idx != -1 else xml.rfind("<w:sectPr")
    assert anchor != -1, "anchor not found"
    new_xml = xml[:anchor] + build() + xml[anchor:]

    tmp = DOC.with_suffix(".docx.tmp")
    with zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED) as zout:
        for item in zin.infolist():
            content = zin.read(item.filename)
            if item.filename == "word/document.xml":
                content = new_xml.encode("utf-8")
            zout.writestr(item, content)
    zin.close()
    shutil.move(str(tmp), str(DOC))
    print("Inserted subsection 10.7 into", DOC.name)


if __name__ == "__main__":
    main()
