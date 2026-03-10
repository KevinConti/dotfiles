# dotfiles

Personal configuration files, managed with symlinks.

## What's included

| Tool | Config path | Description |
|------|------------|-------------|
| tmux | `tmux/.tmux.conf` | Catppuccin-themed status bar, vim-tmux-navigator integration, vi copy mode, mouse support |

## Setup

### Prerequisites

- git
- tmux 3.2+

### Install

```bash
git clone git@github.com:<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script will:
- Symlink each config file to its expected location
- Back up any existing files to `<filename>.bak` before overwriting

### After installing

Reload tmux config (if tmux is already running):

```bash
tmux source-file ~/.tmux.conf
```

Or use `prefix + r` inside tmux.

## Adding new configs

1. Create a directory for the tool (e.g., `nvim/`, `zsh/`)
2. Place the config files inside it
3. Add a `link` line to `install.sh`:
   ```bash
   link "$DOTFILES/<tool>/<config-file>" "$HOME/<target-path>"
   ```
4. Run `./install.sh` again

## Uninstall

Remove the symlinks and restore backups:

```bash
rm ~/.tmux.conf
mv ~/.tmux.conf.bak ~/.tmux.conf  # if backup exists
```
