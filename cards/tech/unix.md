---
name = 'Unix'
---

Q: Bash syntax to run `command` and redirect both `stdout` and `stderr` to `/dev/null`.
A: `command &> /dev/null`

---

Q: Given a file `package.deb`, how do you install it?
A: `dpkg -i package.deb`

---

Q: What does `dpkg -i package.deb` do?
A: Installs `package.deb`.

---

C: Command: [`ln`]

Purpose: [create symbolic links.]

---

Q: Name of the command to create a symbolic link.
A: `ln`

---

Q: In the `ln` command, what is `-s` short for?
A: `--symbolic`

---

Q: In the `ln` command, what does the `-s` flag do?
A: Create a symbolic link instead of a hard link.

---

Q: What is the `ln` command used for?
A: Create symbolic links.

---

Q: Write a command to create a symbolic link from `$link` to `$target`.
A: `ln -s $target $link`

---

Q: Name of the command to test a `fontconfig` font expression.
A: `fc-match`

---

Q: Consider this `fontconfig` expression: `Terminus:size=10`. What unit is the `size` parameter expressed in?
A: Points.

---

Q: Command to lock the screen with xscreensaver.
A: `xscreensaver-command --lock`

---

Q: Shortcut to wipe the password prompt.
A: `C-u`

---

C: Command: [`groups`]

Action: [print the groups the current user is part of.]

---

C: Command: [`groups u`]

Action: [print the groups that user `u` is part of.]

---

Q: Command to print the MIME type of a file `f`.
A: `file --mime-type --brief f`

---

Q: Command to reset Redshift colour temperature.
A: `redshift -x`

---

Q: Command to set Redshift to a temperature `t`.
A: `redshift -O t`

---

C: Signal: [`SIGTERM`]

Effect: [terminate gracefully.]

---

C: Signal: [`SIGKILL`]

Effect: [terminate immediately.]

---

C: Signal: [`SIGINT`]

Effect: [keyboard interrupt.]

---

C: Signal: [`SIGABRT`]

Effect: [process terminated abnormally.]

---

Q: What signal does `Ctrl+C` send?
A: `SIGINT`

---

Q: What key combination sends `SIGINT` in the terminal?
A: `Ctrl+C`

---

Q: What command prints the target of a symbolic link?
A: `readlink`

---

Q: What does the `readlink` command do?
A: Prints the target of a symbolic link.

---

Q: Let _p_ be the path to a symlink. What is the command to find the direct target of _p_?
A: `readlink p`

---

Q: Let _p_ be the path to a symlink. What is the command to find the transitive target of _p_?
A: `readlink -f p`

---

Q: What is the Wayland equivalent of Redshift?
A: `wlsunset`

---

Q: If you want to find the `/dev/...` path of a USB device, what command should you use?
A: `lsblk`

---

Q: How do you make a bootable USB from an `.iso` file?
A: GParted, `Device > Create Partition Table`, select type `msdos`, then use `dd` to copy the ISO.
