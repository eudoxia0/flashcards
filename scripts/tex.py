"""
Generate flashcards to learn TeX macros.
"""

import sys

with open(sys.argv[1], "r") as istream:
    with open(sys.argv[2], "w") as ostream:
        print("---", file=ostream)
        print('name = "TeX"', file=ostream)
        print("---\n", file=ostream)

        first: bool = True
        for line in istream:
            line: str = line.strip()

            if line == "" or line.startswith("%"):
                continue

            if first:
                first = False
            else:
                print("", file=ostream)

            print("C:", file=ostream)
            print(f"TeX: [`{line}`]", file=ostream)
            print("", file=ostream)
            print(f"Result: [${line}$]", file=ostream)
