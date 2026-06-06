#!/bin/bash
set -e

require() {
  command -v "${1}" &>/dev/null && return 0
  printf 'Missing required application: %s\n' "${1}" >&2
  return 1
}

# fish PPA for latest version
sudo apt-add-repository -y ppa:fish-shell/release-4

# apt packages
echo "Installing apt packages..."
sudo apt update
sudo apt install -y stow zsh fzf ripgrep lazygit make ninja-build gettext cmake curl build-essential git git-delta tmux fish

# Rust
if ! require cargo; then
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
fi

# mise
if ! require mise; then
  echo "Installing mise..."
  curl https://mise.run | sh
  eval "$($HOME/.local/bin/mise activate bash)"
fi

# Neovim (build from source)
if ! require nvim; then
  echo "Installing Neovim..."
  mkdir -p ~/git
  git clone https://github.com/neovim/neovim.git ~/git/neovim
  cd ~/git/neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  cd ~
fi

# oh-my-posh
if ! require oh-my-posh; then
  echo "Installing oh-my-posh..."
  curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# diff-so-fancy
if ! require diff-so-fancy; then
  echo "Installing diff-so-fancy..."
  curl -L -o /tmp/diff-so-fancy https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.10/diff-so-fancy
  chmod +x /tmp/diff-so-fancy
  sudo mv /tmp/diff-so-fancy /usr/local/bin/
fi

# cargo-binstall
if ! require cargo-binstall; then
  echo "Installing cargo-binstall..."
  curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
fi

# tree-sitter (via cargo-binstall)
if ! require tree-sitter; then
  echo "Installing tree-sitter-cli..."
  cargo binstall tree-sitter-cli -y
fi

# Claude Code
if ! require claude; then
  echo "Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi

# uv
if ! require uv; then
  echo "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# Tailscale
if ! require tailscale; then
  echo "Installing Tailscale..."
  curl -fsSL https://tailscale.com/install.sh | sh
fi

# tmux plugin manager
TPM_DIR=$HOME/.tmux/plugins/tpm
if [ ! -d "$TPM_DIR" ]; then
  echo "Installing tpm..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
"$TPM_DIR/bin/install_plugins"

# pnpm
if ! require pnpm; then
  echo "Installing pnpm..."
  curl -fsSL https://get.pnpm.io/install.sh -o /tmp/pnpm-install.sh
  PNPM_HOME="$HOME/.local/share/pnpm" sh /tmp/pnpm-install.sh
  rm /tmp/pnpm-install.sh
fi

# docker
if ! require docker; then
  echo "Installing Docker..."
  curl -fsSL https://get.docker.com | sh
  sudo usermod -aG docker $USER
fi

# dotfiles
echo "Installing dotfiles..."
rm -f "$HOME/.zshrc"
cd "$HOME/.dotfiles"
stow --restow .

# mise tools
echo "Installing mise tools..."
mise install

# default shell
echo "Setting zsh as default shell..."
chsh -s $(which zsh)

echo "Done!"
