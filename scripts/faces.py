"""
Generate flashcards for people's faces.
"""

from pathlib import Path

DIR: Path = Path("cards/history/faces/images")


def main():
    # Parse.
    images: list[tuple[str, str]] = []
    for path in DIR.iterdir():
        filename: str = path.name
        name: str = path.stem
        images.append((filename, name))

    # Sort by name.
    images.sort(key=lambda x: x[1])

    # Print deck.
    print("---")
    print('name = "Faces"')
    print("---\n")

    first = True
    for filename, name in images:
        if first:
            first = False
        else:
            print()
            print("---")
            print()

        print("Q: Name?")
        print()
        print(f"![](<images/{filename}>)")
        print()
        print(f"A: {name}")
        print()
        print("---")
        print()
        print(f"Q: Recall: {name}.")
        print()
        print(f"A: ![](<images/{filename}>)")


if __name__ == "__main__":
    main()
