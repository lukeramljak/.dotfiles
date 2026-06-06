# Load completions
autoload -Uz compinit && compinit -u

# Share history between windows
setopt SHARE_HISTORY

# Ignore duplicated commands history list
setopt hist_ignore_dups

ps -p $PPID | grep -q fish || exec fish

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
