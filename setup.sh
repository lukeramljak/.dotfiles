#!/bin/bash

set -e

# function to check if a command exists
require() {
  command -v "${1}" &>/dev/null && return 0
  printf 'Missing required application: %s\n' "${1}" >&2
  return 1
}

# check for Homebrew and install or update
if ! require brew; then
  echo "Installing Homebrew..."
  export NONINTERACTIVE=1
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew update
else
  echo "Homebrew is already installed. Updating..."
  brew update
fi

# tools
echo "Installing tools..."
brew install btop coreutils fd fzf go jq lazygit neovim ripgrep stow tmux zoxide
brew install jandedobbeleer/oh-my-posh/oh-my-posh

# GUI applications
echo "Installing GUI applications..."
brew install alt-tab beekeeper-studio betterdisplay bitwarden bruno dbeaver-community discord firefox ghostty handbrake insomnia monitorcontrol obsidian raycast rectangle shottr visual-studio-code zed

# fonts
echo "Installing fonts..."
brew install font-blex-mono-nerd-font font-fira-code-nerd-font font-geist-mono font-hack-nerd-font font-ibm-plex-mono font-jetbrains-mono-nerd-font

# tmux package manager
TPM_DIR=$HOME/.tmux/plugins/tpm
if [ ! -d "$TPM_DIR" ]; then
  echo "Installing tpm..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi
echo "Installing tmux plugins..."
"$TPM_DIR/bin/install_plugins"

# dotfiles
echo "Installing dotfiles..."
cd ~/.dotfiles
stow --restow .

# neovim
echo "Installing nvim plugins..."
nvim --headless "+Lazy! sync" +qa

# macOS settings
echo "Applying macOS settings..."

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Disable press and hold for keys
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Enable tap to click for trackpad and mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Restart affected applications
APPS=(
  Finder
  Dock
  SystemUIServer
)

for app in "${APPS[@]}"; do
  killall "${app}" &>/dev/null
done

echo "Done!"
