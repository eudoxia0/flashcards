"""
Generate flashcards for the great buildings.
"""

from pathlib import Path

DIR: Path = Path("Cards/Great Buildings")
IMAGE_EXTS = {".jpg", ".jpeg", ".png", ".gif", ".webp"}


def parse_filename(filename: str) -> tuple[str, str]:
    """
    Parse 'Architect—Name' or 'Name' from filename, return (architect | "", title).
    """
    stem = Path(filename).stem
    if "—" in stem:
        parts = stem.split("—", 1)
        artist, title = parts
        if artist == "nil":
            return ("", title.strip())
        else:
            return (artist.strip(), title.strip())
    else:
        return ("", stem.strip())


def main():
    # Parse.
    images: list[tuple[Path, str, str]] = []
    for p in Path("Cards/Great Buildings").iterdir():
        if p.suffix.lower() in IMAGE_EXTS:
            architect, name = parse_filename(p.name)
            filepath: Path = Path("/".join(p.parts[1:]))
            images.append((filepath, architect, name))

    # Sort by architect, then name.
    images.sort(key=lambda x: (x[1], x[2]))

    # Print deck.
    first = True
    for path, architect, name in images:
        if first:
            first = False
        else:
            print()
            print("---")
            print()

        print("Q: Name?")
        print()
        print(f"![](<@/{path}>)")
        print()
        print(f"A: {name}")
        if architect:
            print()
            print("---")
            print()
            print("Q: Architect?")
            print()
            print(f"![](<@/{path}>)")
            print()
            print(f"A: {architect}")


if __name__ == "__main__":
    main()
