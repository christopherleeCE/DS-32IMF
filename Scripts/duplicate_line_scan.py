# duplicate_line_scan.py
# Scans a .s file for duplicate lines and reports them.
# Usage:
#   python duplicate_line_scan.py your_file.s

from collections import defaultdict
import sys
from pathlib import Path

def main():
    if len(sys.argv) != 2:
        print("Usage: python duplicate_line_scan.py <file.s>")
        sys.exit(1)

    file_path = Path(sys.argv[1])

    if not file_path.exists():
        print(f"Error: File not found: {file_path}")
        sys.exit(1)

    line_map = defaultdict(list)

    with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
        for line_num, line in enumerate(f, start=1):
            stripped = line.rstrip("\n")
            line_map[stripped].append(line_num)

    duplicates_found = False

    with open("out.log", "w") as fout:
        for line_text, occurrences in line_map.items():
            if len(occurrences) > 1:
                duplicates_found = True

                fout.write("=" * 80)
                fout.write("\n")
                fout.write(f"Duplicate line found {len(occurrences)} times")
                fout.write("\n")
                fout.write(f"Line numbers: {occurrences}")
                fout.write("\n")
                fout.write("Content:")
                fout.write("\n")
                fout.write(repr(line_text))
                fout.write("\n")

    if not duplicates_found:
        print("No duplicate lines found.")

if __name__ == "__main__":
    main()