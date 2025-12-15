if not status is-interactive
    return 0
end

if test -n "$GHOSTTY_RESOURCES_DIR"
    source $GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

abbr -a nv nvim
abbr -a vim nvim

abbr -a g git
abbr -a ga git add
abbr -a gb git branch
abbr -a gc git commit
abbr -a gco git checkout
abbr -a gf git fetch
abbr -a gl lazygit
abbr -a gm git merge
abbr -a gpl git pull
abbr -a gpu git push
abbr -a gst git status

if test "$os" = Darwin
    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end
    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end
end

set -U fish_greeting

set -g fish_key_bindings fish_vi_key_bindings
set fish_vi_force_cursor 1
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

fzf --fish | source

oh-my-posh init fish --config $HOME/.config/ohmyposh/tokyonight_storm.json | source
