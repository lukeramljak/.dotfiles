# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  fast-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

source ~/.zsh_profile

alias shutdown="sudo shutdown now"
alias reboot="sudo reboot"
alias suspend="sudo systemctl suspend"

alias dots="cd $DOTFILES"
alias dotsinstall="$DOTFILES/install"

alias vim="nvim"

alias tmuxk="tmux kill-session -t"
alias tmuxa="tmux attach -t"
alias tmuxl="tmux list-sessions"

bindkey -s ^f "tmux-sessioniser\n"
