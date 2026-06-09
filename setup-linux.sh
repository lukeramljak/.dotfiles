#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/setup-common.sh"

# fish PPA for latest version
sudo apt-add-repository -y ppa:fish-shell/release-4

# apt packages
# make/ninja-build/gettext/cmake are build deps for neovim)
echo "Installing apt packages..."
sudo apt update
sudo apt install -y stow zsh make ninja-build gettext cmake curl build-essential git git-delta tmux fish

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

# Neovim
if ! require nvim; then
  echo "Installing Neovim..."
  mkdir -p ~/git
  git clone https://github.com/neovim/neovim.git ~/git/neovim
  cd ~/git/neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  cd ~
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

# system files for the Gigabyte Z590 UD AC (suspend fixes: unbind xHCI + amdgpu
# around sleep via a systemd-sleep hook, plus amdgpu runpm=0)
if [ "$(cat /sys/class/dmi/id/board_name 2>/dev/null)" = "Z590 UD AC" ]; then
  echo "Installing Gigabyte Z590 system files (suspend workarounds)..."
  sudo stow -t / system        # symlinks the system-sleep hook; no enable needed
  sudo update-initramfs -u     # bake amdgpu.conf (runpm=0) into the initramfs
fi

install_mise_tools

# default shell
echo "Setting zsh as default shell..."
chsh -s $(which zsh)

finalize_notes

echo "Done!"
