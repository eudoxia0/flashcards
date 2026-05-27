import csv
import sys

with open(sys.argv[1]) as stream:
    a_key, b_key = stream.readline().split(",")
    a_key = a_key.strip()
    b_key = b_key.strip()
    reader = csv.reader(stream, delimiter=",", quotechar='"', skipinitialspace=True)
    first = True
    for a, b in reader:
        a = a.strip()
        b = b.strip()
        if first:
            first = False
        else:
            print()
            print("---")
            print()
        print("C:")
        print(f"{a_key}: [{a}]")
        print()
        print(f"{b_key}: [{b}]")
