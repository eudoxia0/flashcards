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
        name: str = filename.split(".")[0]
        images.append((filename, name))

    # Sort by name.
    images.sort(key=lambda x: x[1])

    # Print deck.
    print("---")
    print('title = "Great Buildings"')
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


if __name__ == "__main__":
    main()
