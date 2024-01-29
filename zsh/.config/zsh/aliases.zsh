##
## Aliases
##

alias shutdown="sudo shutdown now"
alias restart="sudo reboot"
alias suspend="sudo pm-suspend"

alias c="clear"
alias q="exit"
alias cleanram="sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
alias trim_all="sudo fstrim -va"
alias mkgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mtar="tar -zcvf" # mtar <archive_compress>
alias utar="tar -zxvf" # utar <archive_decompress> <file_list>
alias z="zip -r" # z <archive_compress> <file_list>
alias uz="unzip" # uz <archive_decompress> -d <dir>
alias sr="source ~/.config/zsh/env.zsh"
alias ..="cd .."
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" 
alias mkdir="mkdir -p"

alias ls="eza --color=auto --icons"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias cat="bat --color always --plain"
alias grep="grep --color=auto"
alias mv="mv -v"
alias cp="cp -vr"
alias rm="rm -vr"

alias vim="nvim"

alias tmuxk="tmux kill-session -t"
alias tmuxa="tmux attach -t"
alias tmuxl="tmux list-sessions"

alias gs="git status"
alias gss="git status -s"
alias ga="git add"
alias gp="git push"
alias gpraise="git blame"
alias gpo="git push origin"
alias gpof="git push origin --force-with-lease"
alias gpofn="git push origin --force-with-lease --no-verify"
alias gpt="git push --tag"
alias gtd="git tag --delete"
alias gtdr="git tag --delete origin"
alias grb="git branch -r" # display remote branch
alias gplo="git pull origin"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"
alias gl="git log --pretty=oneline"
alias gr="git remote"
alias grs="git remote show"
alias glol="git log --graph --abbrev-commit --oneline --decorate"
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
alias gsub="git submodule update --remote"                                                        # pull submodules
alias gj="git-jump"                                                                               # Open in vim quickfix list files of interest (git diff, merged...)

alias dif="git diff --no-index"                                                                   # Diff two files even if not in git repo! Can add -w (don't diff whitespaces)

# vim:ft=zsh
