# Activate mise before config.fish runs, so tools managed by mise
# (fzf, oh-my-posh, zoxide, ...) are on PATH when it initializes them.
status is-interactive; and mise activate fish | source
