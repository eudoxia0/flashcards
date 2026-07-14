#!/usr/bin/env python
"""
Generate flashcards from a CSV and a template.
"""

import argparse
import csv


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate flashcards from a CSV and template."
    )
    parser.add_argument("--csv", required=True, help="Path to the CSV file.")
    parser.add_argument("--template", required=True, help="Path to the template file.")
    parser.add_argument(
        "--output", required=True, help="Path to the output Markdown file."
    )
    parser.add_argument("--title", required=True, help="Deck title.")
    args = parser.parse_args()
    title: str = args.title

    with open(args.template, "r") as f:
        template = f.read()

    with open(args.csv, newline="") as f:
        reader = csv.DictReader(f, delimiter=",", quotechar='"', skipinitialspace=True)
        rows = [clean_row(row) for row in list(reader)]

    blocks = [template.format(**row) for row in rows]

    with open(args.output, "w") as f:
        f.write("---\n")
        f.write(f"title = '{title}'\n")
        f.write("---\n\n")
        f.write("\n\n---\n\n".join(blocks))
        f.write("\n")


def clean_row(row: dict[str, str]) -> dict[str, str]:
    return {k: v.strip() for k, v in row.items()}


if __name__ == "__main__":
    main()
