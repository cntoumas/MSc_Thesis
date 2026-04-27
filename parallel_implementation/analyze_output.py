import csv

re = []
im = []
with open('hw_output.csv', 'r') as f:
    reader = csv.reader(f)
    for row in reader:
        try:
            re.append(int(row[0]))
        except ValueError:
            re.append(0)
        try:
            im.append(int(row[1]))
        except ValueError:
            im.append(0)

print(f"Total samples: {len(re)}")
non_zero_indices = [i for i, (r, m) in enumerate(zip(re, im)) if r != 0 or m != 0]
if non_zero_indices:
    print(f"First non-zero index: {non_zero_indices[0]}")
    print(f"Last non-zero index: {non_zero_indices[-1]}")
    print(f"Number of non-zero samples: {len(non_zero_indices)}")
else:
    print("All samples are zero!")
