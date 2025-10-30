# Deck-Relative Path Support Implementation

This document describes the implementation of deck-relative and collection-relative path support in hashcards.

## Problem Statement

Previously, all image/file paths in flashcards were resolved relative to the collection root directory. This had drawbacks:

1. **Noisy paths**: Decks that colocate images with the deck file had to use full paths from the collection root
2. **Not portable**: Moving a directory containing both decks and images would break all references

Example problematic structure:
```
Molecular Biology of the Cell/
  Images/
    protein.jpg
    cell.png
  Ch1.md  # Must reference "Molecular Biology of the Cell/Images/protein.jpg"
  Ch2.md  # instead of just "Images/protein.jpg"
```

## Solution

Support two types of paths:

### 1. Deck-Relative Paths (Default - **BREAKING CHANGE**)

By default, paths are now resolved relative to the deck file containing the flashcard.

**Example:**
- Deck file: `Cards/math/algebra/Ch1.md`
- Image reference: `images/diagram.jpg`
- Resolves to: `Cards/math/algebra/images/diagram.jpg`

**With parent directories:**
- Deck file: `Cards/math/algebra/Ch1.md`
- Image reference: `../images/shared.jpg`
- Resolves to: `Cards/math/images/shared.jpg`

### 2. Collection-Relative Paths (@ Prefix)

Paths starting with `@` are resolved relative to the collection root directory. This preserves the old behavior with explicit syntax.

**Example:**
- Deck file: `Cards/math/algebra/Ch1.md`
- Image reference: `@shared-images/logo.jpg`
- Resolves to: `Cards/shared-images/logo.jpg`

## Implementation Details

### Files Changed

1. **`src/path_resolution.rs`** (NEW)
   - New module with `resolve_media_path()` function
   - Handles both @-prefix and deck-relative path resolution
   - Normalizes paths to resolve `.` and `..` components
   - Validates paths stay within collection directory

2. **`src/media.rs`**
   - Updated `validate_media_files()` to use `resolve_media_path()`
   - Now checks for media files using resolved paths

3. **`src/markdown.rs`**
   - Updated `markdown_to_html()` and `markdown_to_html_inline()` to accept card file path and collection directory
   - Modified `modify_url()` to resolve paths before creating URLs
   - URLs sent to browser contain collection-relative paths (after resolution)

4. **`src/types/card.rs`**
   - Updated `html_front()` and `html_back()` methods to accept collection directory parameter
   - Pass card's file path to markdown conversion functions

5. **`src/cmd/drill/get.rs`**
   - Updated `render_card()` to pass collection directory from ServerState

6. **`src/main.rs`**
   - Added `mod path_resolution;` declaration

### Key Design Decisions

1. **Path resolution happens during markdown-to-HTML conversion**
   - Paths are resolved when generating HTML for display
   - File serving endpoint receives already-resolved collection-relative paths
   - Keeps file serving logic simple and secure

2. **No changes to file serving validation**
   - The `validate_file_path()` function in `drill/file.rs` remains unchanged
   - It still validates that paths don't escape the collection directory
   - Since resolved paths never contain `..`, existing validation works as-is

3. **URL structure**
   - URLs still use the format: `http://localhost:{port}/file/{path}`
   - The `{path}` is now a resolved collection-relative path
   - Browser doesn't see the original deck-relative or @-prefixed paths

### Example Workflow

For a card in `Cards/bio/cell/Ch1.md` with image `../images/protein.jpg`:

1. **During markdown-to-HTML conversion:**
   - Input: `../images/protein.jpg`
   - Card file: `/full/path/Cards/bio/cell/Ch1.md`
   - Collection: `/full/path/Cards`
   - Resolution:
     - Deck dir: `/full/path/Cards/bio/cell/`
     - Join: `/full/path/Cards/bio/cell/../images/protein.jpg`
     - Normalize: `/full/path/Cards/bio/images/protein.jpg`
     - Relative to collection: `bio/images/protein.jpg`
   - URL: `http://localhost:8080/file/bio/images/protein.jpg`

2. **During file serving:**
   - Request: `/file/bio/images/protein.jpg`
   - Validated against collection root
   - Served from: `/full/path/Cards/bio/images/protein.jpg`

3. **During media validation:**
   - Same resolution process as markdown conversion
   - Checks if file exists at resolved path

## Testing

Tests added in `src/path_resolution.rs`:
- Collection-relative path resolution (@ prefix)
- Deck-relative path resolution
- Path resolution with parent directory references (..)
- Prevention of directory traversal (paths escaping collection)
- URL skipping (http://, https://)
- Path normalization

Updated tests in `src/markdown.rs`:
- All tests updated to pass required path parameters

## Migration Notes

**This is a BREAKING CHANGE** for existing flashcard collections that use image/file references.

### Migration Strategy

1. **For decks with colocated images** (the common case):
   - No changes needed! Paths like `images/photo.jpg` will now work correctly

2. **For decks using collection-root-relative paths**:
   - Add `@` prefix to all image paths
   - Example: `shared/images/logo.jpg` → `@shared/images/logo.jpg`

3. **Migration script** (if needed):
   ```bash
   # Find all markdown files with image references
   find Cards -name "*.md" -exec grep -l "!\[.*\](.*)" {} \;

   # Manual review recommended to determine which paths need @ prefix
   ```

## Security Considerations

- Path resolution includes directory traversal prevention
- Paths attempting to escape the collection directory return `None`
- File serving validation remains unchanged and effective
- No risk of serving files outside the collection directory

## Future Enhancements

Potential improvements:
1. Add a compatibility mode flag to preserve old behavior
2. Provide a migration tool to automatically add @ prefixes
3. Support for absolute filesystem paths (if needed for special use cases)
