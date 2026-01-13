# Load completions
autoload -Uz compinit && compinit -u

# Share history between windows
setopt SHARE_HISTORY

# Ignore duplicated commands history list
setopt hist_ignore_dups

if ! ps -p $PPID | grep -q fish; then
  fish
fi

. "$HOME/.local/share/../bin/env"
