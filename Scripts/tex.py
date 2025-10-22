import sys

with open(sys.argv[1], "r") as istream:
    with open(sys.argv[2], "w") as ostream:
        first: bool = True
        for line in istream:
            line: str = line.strip()

            if line == "":
                continue

            if first:
                first = False
            else:
                print("", file=ostream)

            print("C:", file=ostream)
            print(f"TeX: [`{line}`]", file=ostream)
            print("", file=ostream)
            print(f"Result: [${line}$]", file=ostream)
