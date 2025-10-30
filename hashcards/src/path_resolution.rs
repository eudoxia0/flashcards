// Copyright 2025 Fernando Borretti
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

use std::path::Path;
use std::path::PathBuf;

/// Resolves a media path from a card to a collection-relative path.
///
/// This function handles two types of paths:
/// 1. Collection-relative paths (prefixed with '@'): These are resolved relative to the collection root.
///    Example: `@images/foo.jpg` in any deck resolves to `images/foo.jpg`
///
/// 2. Deck-relative paths (default): These are resolved relative to the deck file's directory.
///    Example: `../images/foo.jpg` in `Cards/math/algebra.md` resolves to `Cards/images/foo.jpg`
///
/// # Arguments
/// * `media_path` - The path as written in the markdown (e.g., "img/foo.jpg" or "@img/foo.jpg")
/// * `card_file_path` - The absolute path to the deck file containing the card
/// * `collection_dir` - The absolute path to the collection root directory
///
/// # Returns
/// A path relative to the collection directory, suitable for:
/// - File validation (checking if the file exists)
/// - Serving via the `/file/{path}` HTTP endpoint
///
/// # Errors
/// Returns `None` if the path cannot be resolved (e.g., path escapes collection directory)
pub fn resolve_media_path(
    media_path: &str,
    card_file_path: &Path,
    collection_dir: &Path,
) -> Option<PathBuf> {
    // Skip URLs (http://, https://, etc.)
    if media_path.contains("://") {
        return None;
    }

    // Handle collection-relative paths (prefixed with '@')
    if let Some(path_without_prefix) = media_path.strip_prefix('@') {
        // Remove leading slashes after '@'
        let path = path_without_prefix.trim_start_matches('/');
        return Some(PathBuf::from(path));
    }

    // Handle deck-relative paths (default)
    // Get the directory containing the deck file
    let card_dir = card_file_path.parent()?;

    // Resolve the media path relative to the card's directory
    let absolute_media_path = card_dir.join(media_path);

    // Canonicalize to resolve ".." and "." components
    // Note: This requires the file to exist. For validation, we'll handle this differently.
    // For now, we'll manually normalize the path.
    let normalized = normalize_path(&absolute_media_path);

    // Make it relative to the collection directory
    let relative = normalized.strip_prefix(collection_dir).ok()?;

    Some(relative.to_path_buf())
}

/// Normalizes a path by resolving "." and ".." components without accessing the filesystem.
///
/// This is needed because `canonicalize()` requires the file to exist, but we want to
/// resolve paths even for files that don't exist yet (for better error messages).
fn normalize_path(path: &Path) -> PathBuf {
    let mut components = Vec::new();

    for component in path.components() {
        match component {
            std::path::Component::CurDir => {
                // Skip "." components
            }
            std::path::Component::ParentDir => {
                // Pop the last component for ".."
                if !components.is_empty() {
                    components.pop();
                }
            }
            _ => {
                components.push(component);
            }
        }
    }

    components.iter().collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_resolve_collection_relative_path() {
        let collection_dir = PathBuf::from("/home/user/flashcards/Cards");
        let card_file = PathBuf::from("/home/user/flashcards/Cards/math/algebra.md");

        let result = resolve_media_path("@images/diagram.jpg", &card_file, &collection_dir);
        assert_eq!(result, Some(PathBuf::from("images/diagram.jpg")));
    }

    #[test]
    fn test_resolve_collection_relative_path_with_slash() {
        let collection_dir = PathBuf::from("/home/user/flashcards/Cards");
        let card_file = PathBuf::from("/home/user/flashcards/Cards/math/algebra.md");

        // "@/images/..." should work the same as "@images/..."
        let result = resolve_media_path("@/images/diagram.jpg", &card_file, &collection_dir);
        assert_eq!(result, Some(PathBuf::from("images/diagram.jpg")));
    }

    #[test]
    fn test_resolve_deck_relative_path() {
        let collection_dir = PathBuf::from("/home/user/flashcards/Cards");
        let card_file = PathBuf::from("/home/user/flashcards/Cards/math/algebra.md");

        let result = resolve_media_path("images/diagram.jpg", &card_file, &collection_dir);
        assert_eq!(result, Some(PathBuf::from("math/images/diagram.jpg")));
    }

    #[test]
    fn test_resolve_deck_relative_path_with_parent() {
        let collection_dir = PathBuf::from("/home/user/flashcards/Cards");
        let card_file = PathBuf::from("/home/user/flashcards/Cards/math/algebra/linear.md");

        let result = resolve_media_path("../images/diagram.jpg", &card_file, &collection_dir);
        assert_eq!(result, Some(PathBuf::from("math/images/diagram.jpg")));
    }

    #[test]
    fn test_resolve_deck_relative_path_escaping_collection() {
        let collection_dir = PathBuf::from("/home/user/flashcards/Cards");
        let card_file = PathBuf::from("/home/user/flashcards/Cards/math/algebra.md");

        // Try to escape the collection directory
        let result = resolve_media_path("../../../etc/passwd", &card_file, &collection_dir);
        // This should fail because the path escapes the collection
        assert_eq!(result, None);
    }

    #[test]
    fn test_skip_urls() {
        let collection_dir = PathBuf::from("/home/user/flashcards/Cards");
        let card_file = PathBuf::from("/home/user/flashcards/Cards/math/algebra.md");

        let result = resolve_media_path("https://example.com/image.jpg", &card_file, &collection_dir);
        assert_eq!(result, None);
    }

    #[test]
    fn test_normalize_path() {
        let path = PathBuf::from("/home/user/flashcards/Cards/math/../images/./diagram.jpg");
        let normalized = normalize_path(&path);
        assert_eq!(normalized, PathBuf::from("/home/user/flashcards/Cards/images/diagram.jpg"));
    }

    #[test]
    fn test_normalize_path_with_multiple_parents() {
        let path = PathBuf::from("/home/user/flashcards/Cards/math/algebra/../../images/diagram.jpg");
        let normalized = normalize_path(&path);
        assert_eq!(normalized, PathBuf::from("/home/user/flashcards/Cards/images/diagram.jpg"));
    }
}
