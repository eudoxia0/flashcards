Q: What command prints the target of a symbolic link?
A: `readlink`

Q: What does the `readlink` command do?
A: Print the target of a symbolic link.

Q: Let _p_ be the path to a symlink. What is the command to find the direct target of _p_?
A: `readlink p`

Q: Let _p_ be the path to a symlink. What is the command to find the transitive target of _p_?
A: `readlink -f p`
