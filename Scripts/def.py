import csv
import sys

with open(sys.argv[1]) as stream:
    reader = csv.reader(stream, delimiter=",", quotechar='"', skipinitialspace=True)
    first = True
    for word, definition in reader:
        if first:
            first = False
        else:
            print()
        print(f"Q: {word.strip()}")
        print(f"A: {definition.strip()}")
