import sys
import os

# Construct the full path to the input file inside runfiles
source_file = sys.argv[1]
target_file = sys.argv[2]

print(f"Reading from: {source_file}")
print(f"Writing to: {target_file}")

with open(source_file, "r") as source:
    in_data = source.read()

out_string = in_data.upper()

with open(target_file, "w") as target:
    target.write(out_string)

print("Done!")




