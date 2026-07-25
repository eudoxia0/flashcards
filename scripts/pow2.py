"""
Generate flashcards to learn the powers of two.
"""

first = True
for n in range(2, 17):
    if first:
        first = False
    else:
        print()
        print("---")
        print()
    print(f"Q: $2^{{{n}}}$")
    print()
    print(f"A: ${2**n}$")
    print()
    print("---")
    print()
    print(f"Q: $\\log_2 {2**n}$")
    print()
    print(f"A: ${n}$")
    if n < 16:
        print()
