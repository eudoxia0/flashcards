---
name = 'Nix'
---

Q: Command to create a `flake.lock`, from a `flake.nix` in the current directory.
A: `nix flake lock`

---

Q: Command to enter a shell for the Nix flake in the current directory.
A: `nix develop`.

---

Q: Command to search for Nix packages matching the regex `$RE`.
A: `nix search nixpkgs $RE`

---

Q: Command to build and a switch to a new NixOS config described in `config.nix`, without flakes.
A: `sudo nixos-rebuild switch -I nixos-config=config.nix`

---

Q: I'm in a directory with a `shell.nix`. I want to run the command `foo bar` inside the shell.
A: `nix-shell --run "foo bar"`
