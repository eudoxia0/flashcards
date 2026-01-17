"""
Generate flashcards for the great works.
"""

import sys
from pathlib import Path

ART_DIR = Path("Cards/Art")
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
    # Load images.
    images: list[tuple[Path, str, str]] = []
    for f in ART_DIR.iterdir():
        if f.suffix.lower() in IMAGE_EXTS:
            parsed = parse_filename(f.name)
            if parsed:
                artist: str
                title: str
                artist, title = parsed
                filepath: Path = Path("/".join(f.parts[1:]))
                images.append((filepath, artist, title))
            else:
                print(f"Warning: skipping {f.name} (invalid format)", file=sys.stderr)

    # Sort by artist, then title.
    images.sort(key=lambda x: (x[1], x[2]))

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
