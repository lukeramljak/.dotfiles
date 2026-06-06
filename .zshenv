. "$HOME/.cargo/env"

export GPG_TTY=$(tty)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export EDITOR="$(which nvim)"
export VISUAL="$EDITOR"
export COLORTERM=truecolor
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/config
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export BROWSER=none

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# macOS only
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"

  # mobile dev
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/platform-tools
else
  export PNPM_HOME="$HOME/.local/share/pnpm"
fi

export PATH="$PNPM_HOME/bin:$PATH"
