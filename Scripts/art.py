"""
Generate flashcards for the great works.
"""

from pathlib import Path

ART_DIR = Path("Cards/Art")
IMAGE_EXTS = {".jpg", ".jpeg", ".png", ".gif", ".webp"}


def parse_filename(filename: str) -> tuple[str | None, str]:
    """
    Parse 'Artist—Name' from filename.
    """
    stem: str = Path(filename).stem
    if "—" not in stem:
        raise ValueError(f"Invalid filename format: '{filename}'")

    parts: list[str] = stem.split("—", 1)

    if len(parts) != 2:
        raise ValueError(f"Invalid filename format: '{filename}'")

    artist: str
    title: str
    artist, title = parts
    title = title.strip()
    if artist == "nil":
        return (None, title)
    else:
        return (artist, title)


def main():
    # Parse.
    images: list[tuple[Path, str | None, str]] = []
    for p in Path("Cards/Art").iterdir():
        if p.suffix.lower() in IMAGE_EXTS:
            artist, name = parse_filename(p.name)
            filepath: Path = Path("/".join(p.parts[1:]))
            images.append((filepath, artist, name))

    # Sort by artist, then name.
    images.sort(key=lambda x: (x[1] or "", x[2]))

    # Print deck.
    first = True
    for path, artist, title in images:
        if first:
            first = False
        else:
            print()
            print("---")
            print()

        print("Q: Title?")
        print()
        print(f"![](<@/{path}>)")
        print()
        print(f"A: {title}")
        if artist is not None:
            print()
            print("---")
            print()
            print("Q: Artist?")
            print()
            print(f"![](<@/{path}>)")
            print()
            print(f"A: {artist}")


if __name__ == "__main__":
    main()
