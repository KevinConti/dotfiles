export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH=/Users/kevinconti/.local/bin:$PATH
export PATH=/Users/kevinconti/.local/bin:$PATH


# Added by flyctl installer
export FLYCTL_INSTALL="/Users/kevinconti/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/kevinconti/.bun/_bun" ] && source "/Users/kevinconti/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# tmuxinator aliases
alias tm='tmuxinator list'
alias tms='tmuxinator start'
alias tmk='tmuxinator stop'
