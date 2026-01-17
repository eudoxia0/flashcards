"""
Generate flashcards for the great buildings.
"""

import sys
from pathlib import Path

DIR: Path = Path("Cards/Great Buildings")
IMAGE_EXTS = {".jpg", ".jpeg", ".png", ".gif", ".webp"}


def parse_filename(filename: str) -> tuple[str, str] | None:
    """Parse 'Artist—Title' from filename, return (artist, title) or None."""
    stem = Path(filename).stem
    if "—" not in stem:
        return None
    parts = stem.split("—", 1)
    if len(parts) != 2:
        return None
    artist, title = parts
    return artist.strip(), title.strip()


def main():
    # Parse.
    images: list[tuple[Path, str, str]] = []
    for p in Path("Cards/Great Buildings").iterdir():
        if p.suffix.lower() in IMAGE_EXTS:
            architect, name = p.stem.split("—")
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
