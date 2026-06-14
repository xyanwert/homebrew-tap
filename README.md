# homebrew-tap

Homebrew tap for [xyanwert](https://github.com/xyanwert)'s tools.

## claude-monitor

[Burnout](https://github.com/xyanwert/usage-monitor) — a pixel-animated Claude
usage monitor that is also a fire.

### Install

```bash
brew install xyanwert/tap/claude-monitor
```

That one command adds this tap and pulls in everything it needs (Python 3 and
`tmux`). It's shorthand for:

```bash
brew tap xyanwert/tap
brew install claude-monitor
```

### Update

```bash
brew update && brew upgrade claude-monitor
```

### Bleeding edge (latest `main`)

```bash
brew install --HEAD xyanwert/tap/claude-monitor
# later: brew upgrade --fetch-HEAD claude-monitor
```

### Uninstall

```bash
brew uninstall claude-monitor
brew untap xyanwert/tap   # optional: forget the tap
```

### Run

```bash
claude-monitor                   # full-window monitor
claude-monitor side claude       # claude left, fire right (needs tmux)
claude-monitor --scene invaders  # fire | tokens | invaders | cube
claude-monitor --once            # print usage once and exit
```

macOS: credentials are read from the Keychain automatically. Apple's
Terminal.app lacks truecolor — use iTerm2, Ghostty, kitty, or WezTerm.
