##
## Keybindings
##

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey -s '^K' 'ls^M'
bindkey -s '^o' '_smooth_fzf^M'

# fix backspace and other stuff in vi-mode
bindkey -M viins '\e/' _vi_search_fix
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line

# vim:ft=zsh:nowrap
