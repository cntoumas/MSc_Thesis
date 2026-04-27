#!/usr/bin/env python3
"""
Detailed analysis of when valid_out appears vs when it disappears
"""

with open('hw_output.csv', 'r') as f:
    lines = f.readlines()

# Count samples per 8-sample block
blocks = []
for i in range(0, len(lines), 8):
    block_samples = []
    for j in range(i, min(i+8, len(lines))):
        line = lines[j].strip()
        has_x = 'X' in line
        block_samples.append((j, line, has_x))
    blocks.append((i//8, block_samples))

print("Block-wise analysis (first 15 blocks):")
print("Block | Sample Status")
print("------|" + "-"*60)
for block_num, samples in blocks[:15]:
    x_count = sum(1 for _, _, has_x in samples if has_x)
    status = f"{x_count}/8 X" if x_count > 0 else "ALL VALID"
    sample_str = ''.join(['X' if has_x else 'V' for _, _, has_x in samples])
    print(f"  {block_num:3d}  | {sample_str} ({status})")

# Find where transition happens
print("\n\nTransition analysis:")
for block_num, samples in enumerate(blocks):
    x_count = sum(1 for _, _, has_x in samples if has_x)
    if block_num < 12:
        print(f"Block {block_num}: {x_count}/8 X")
    if block_num == 8:
        next_block = blocks[9] if block_num + 1 < len(blocks) else None
        next_x = sum(1 for _, _, has_x in next_block if has_x) if next_block else 8
        print(f"  >>> TRANSITION: Block 8 has {sum(1 for _, _, has_x in samples if has_x)}/8 X, Block 9 has {next_x}/8 X")

print(f"\n\nTotal blocks: {len(blocks)}")
print(f"First block with all X: ", end="")
for block_num, samples in enumerate(blocks):
    x_count = sum(1 for _, _, has_x in samples if has_x)
    if x_count == 8:
        print(f"Block {block_num}")
        break
else:
    print("Never (all blocks have at least 1 valid sample)")
