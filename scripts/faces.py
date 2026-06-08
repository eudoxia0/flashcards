"""
Generate flashcards for people's faces.
"""

from pathlib import Path

DIR: Path = Path("cards/history/faces/images")


def main():
    # Parse.
    images: list[tuple[Path, str]] = []
    for path in DIR.iterdir():
        name: str = str(path.stem).split(".")[0]
        images.append((path, name))

    # Sort by name.
    images.sort(key=lambda x: x[1])

    # Print deck.
    print("---")
    print('title = "Great Buildings"')
    print("---\n")

    first = True
    for path, name in images:
        if first:
            first = False
        else:
            print()
            print("---")
            print()

        print("Q: Name?")
        print()
        print(f"![](<{path}>)")
        print()
        print(f"A: {name}")


if __name__ == "__main__":
    main()
