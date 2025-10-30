"""
Generate flashcards for FDI notatation.
"""

QUADRANTS: list[tuple[int, str]] = [
    (1, "upper right"),
    (2, "upper left"),
    (3, "lower left"),
    (4, "lower right"),
]

TEETH: list[tuple[int, str]] = [
    (1, "central incisors"),
    (2, "lateral incisors"),
    (3, "canines"),
    (4, "first premolars"),
    (5, "second premolars"),
    (6, "first molars"),
    (7, "second molars"),
    (8, "third molars"),
]

for c, n in QUADRANTS:
    print(f"C: Quadrant Code: [{c}]")
    print()
    print(f"Quadrant: [{n}]")
    print()
    print("---")
    print()

for c, n in TEETH:
    print(f"C: Tooth Code: [{c}]")
    print()
    print(f"Tooth: [{n}]")
    print()
    print("---")
    print()

for qc, qn in QUADRANTS:
    for tc, tn in TEETH:
        print(f"C: FDI Notation: [{qc}{tc}]")
        print()
        print(f"Tooth: [{qn} {tn}]")
        if not (qc == 4 and tc == 8):
            print()
            print("---")
            print()
