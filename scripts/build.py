"""
Generate flashcards for the great buildings.
"""

from pathlib import Path

DIR: Path = Path("cards/Great Buildings")
IMAGE_EXTS = {".jpg", ".jpeg", ".png", ".gif", ".webp"}


def parse_filename(filename: str) -> tuple[str | None, str]:
    """
    Parse 'Architect—Name' from filename.
    """
    stem: str = Path(filename).stem
    if "—" not in stem:
        raise ValueError(f"Invalid filename format: '{filename}'")

    parts: list[str] = stem.split("—", 1)

    if len(parts) != 2:
        raise ValueError(f"Invalid filename format: '{filename}'")

    architect: str
    title: str
    architect, title = parts
    title = title.strip()
    if architect == "nil":
        return (None, title)
    else:
        return (architect, title)


def main():
    # Parse.
    images: list[tuple[Path, str | None, str]] = []
    for p in Path("cards/Great Buildings").iterdir():
        if p.suffix.lower() in IMAGE_EXTS:
            architect, name = parse_filename(p.name)
            filepath: Path = Path("/".join(p.parts[1:]))
            images.append((filepath, architect, name))

    # Sort by architect, then name.
    images.sort(key=lambda x: (x[1] or "", x[2]))

    print("---")
    print('title = "Great Buildings"')
    print("---\n")

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
