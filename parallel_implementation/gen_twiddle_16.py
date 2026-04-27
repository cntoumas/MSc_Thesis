import numpy as np

N = 4096
WIDTH = 16
SCALE = (1 << (WIDTH - 1)) - 1

n = np.arange(513) # 0 to N/8 inclusive
theta = 2 * np.pi * n / N

cos_vals = np.round(np.cos(theta) * SCALE).astype(np.int64)
sin_vals = np.round(np.sin(theta) * SCALE).astype(np.int64)

def to_hex(val, width):
    if val < 0:
        val = (1 << width) + val
    return f"{val:0{width//4}X}"

with open("cos.mem", "w") as f:
    f.write(f"// Cosine ROM: 1/8 cycle for N={N}, WIDTH={WIDTH}\n")
    for v in cos_vals:
        f.write(to_hex(v, WIDTH) + "\n")

with open("sin.mem", "w") as f:
    f.write(f"// Sine ROM: 1/8 cycle for N={N}, WIDTH={WIDTH}\n")
    for v in sin_vals:
        f.write(to_hex(v, WIDTH) + "\n")

print(f"Generated 16-bit twiddle ROMs.")
