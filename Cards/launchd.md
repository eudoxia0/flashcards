Q: Command to control `launchd`.
A: `launchctl`

Q: Types of jobs in `launchd`.
A: Daemons and agents.

C: `launchd` [daemons] starts when [the system boots].

C: `launchd` [agents] starts when [their associated user logs in].

Q: Directory for daemon plist files.
A: `/Library/LaunchDaemons/`

Q: Directory for my user's agent plist files.
A: `~/Library/LaunchAgents/`

Q: Directory for system-wide agent plist files.
A: `/Library/LaunchAgents/`
