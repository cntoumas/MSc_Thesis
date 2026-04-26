import numpy as np # type: ignore

def generate_twiddle_roms():
    # --- Parameters matching the Verilog module ---
    N = 4096
    WIDTH = 16
    FRACTIONAL_BITS = WIDTH - 1

    # For 1/8 cycle compression, we need indices from 0 to N/8 inclusive
    num_values = (N // 8) + 1 

    # The maximum positive value for a signed 16-bit integer (Q1.15 format)
    # 2^15 - 1 = 32767. This prevents overflow when cos(0) = 1.0.
    MAX_VAL = (1 << FRACTIONAL_BITS) - 1

    print(f"Generating ROM files for N={N}, WIDTH={WIDTH} (Q1.{FRACTIONAL_BITS})")
    print(f"Total values to compute: {num_values} (1/8 cycle)")

    # Open the .mem files for writing
    with open("cos.mem", "w") as f_cos, open("sin.mem", "w") as f_sin:
        
        # Add a header for readability (Verilog ignores comments in .mem files)
        f_cos.write(f"// Cosine ROM: 1/8 cycle (0 to pi/4) for N={N}\n")
        f_sin.write(f"// Sine ROM: 1/8 cycle (0 to pi/4) for N={N}\n")

        for k in range(num_values):
            # Calculate the angle (theta) for the current index
            theta = 2.0 * np.pi * k / N
            
            # Calculate actual sine and cosine
            cos_val = np.cos(theta)
            sin_val = np.sin(theta)
            
            # Convert to Q1.15 fixed-point integers
            cos_q = int(np.round(cos_val * MAX_VAL))
            sin_q = int(np.round(sin_val * MAX_VAL))
            
            # Format as 4-character uppercase Hexadecimal strings
            # The bitwise AND (& 0xFFFF) ensures clean formatting if you ever 
            # change the script to generate negative numbers in two's complement.
            cos_hex = f"{cos_q & 0xFFFF:04X}"
            sin_hex = f"{sin_q & 0xFFFF:04X}"
            
            # Write the hexadecimal string to the files
            f_cos.write(f"{cos_hex}\n")
            f_sin.write(f"{sin_hex}\n")

    print("Success! 'cos.mem' and 'sin.mem' have been generated.")

if __name__ == "__main__":
    generate_twiddle_roms()