#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/setup-common.sh"

# fish PPA for latest version
sudo apt-add-repository -y ppa:fish-shell/release-4

# apt packages
echo "Installing apt packages..."
sudo apt update
sudo apt install -y stow zsh make curl build-essential git git-delta tmux fish

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

# Claude Code
if ! require claude; then
  echo "Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi

# Tailscale
if ! require tailscale; then
  echo "Installing Tailscale..."
  curl -fsSL https://tailscale.com/install.sh | sh
fi

install_tpm

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

link_dotfiles
install_mise_tools

# default shell
echo "Setting zsh as default shell..."
chsh -s $(which zsh)

echo "Done!"
