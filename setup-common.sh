#!/bin/bash
# Shared helpers and final steps for setup-mac.sh / setup-linux.sh.
# Source this near the top of each OS script so `require` is available,
# then call the finalize_* functions at the end.

# check if a command exists
require() {
  command -v "${1}" &>/dev/null && return 0
  printf 'Missing required application: %s\n' "${1}" >&2
  return 1
}

# tmux plugin manager + plugins
install_tpm() {
  local tpm_dir="$HOME/.tmux/plugins/tpm"
  if [ ! -d "$tpm_dir" ]; then
    echo "Installing tpm..."
    git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
  fi
  echo "Installing tmux plugins..."
  "$tpm_dir/bin/install_plugins"
}

# symlink dotfiles into $HOME with stow
link_dotfiles() {
  echo "Installing dotfiles..."
  rm -f "$HOME/.zshrc"
  mkdir -p "$HOME/.config"   # ensure ~/.config is a real dir so stow folds per-package, not the whole tree
  cd "$HOME/.dotfiles" || exit 1
  stow --restow .
}

# install tools declared in .config/mise/config.toml
# (run after link_dotfiles so the config is in place)
install_mise_tools() {
  echo "Installing mise tools..."
  mise install
}
