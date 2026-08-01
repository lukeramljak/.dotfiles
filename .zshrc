# Use fish for interactive terminal sessions only.
if [[ -o interactive && -t 0 && -t 1 ]]; then
  ps -p "$PPID" | grep -q fish || exec fish
fi

# The remainder only applies when zsh is deliberately used interactively.
autoload -Uz compinit && compinit -u
setopt SHARE_HISTORY HIST_IGNORE_DUPS

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
