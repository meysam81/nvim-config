#!/usr/bin/env bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Detect OS
detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
  elif [[ -f /etc/fedora-release ]]; then
    OS="fedora"
  elif [[ -f /etc/debian_version ]]; then
    OS="ubuntu"
  else
    log_error "Unsupported OS"
    exit 1
  fi
  log_info "Detected OS: $OS"
}

# Install system packages
install_system_packages() {
  log_info "Installing system packages..."

  case $OS in
    macos)
      if ! command -v brew &> /dev/null; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      fi
      brew install neovim ripgrep fd lua-language-server
      ;;
    fedora)
      sudo dnf install -y neovim ripgrep fd-find
      brew install lua-language-server
      ;;
    ubuntu)
      sudo apt update
      sudo apt install -y neovim ripgrep fd-find

      # lua-language-server not in apt, install manually
      if ! command -v lua-language-server &> /dev/null; then
        log_info "Installing lua-language-server..."
        LUA_LS_VERSION="3.7.4"
        mkdir -p ~/.local/bin
        cd /tmp
        curl -L -o lua-ls.tar.gz "https://github.com/LuaLS/lua-language-server/releases/download/${LUA_LS_VERSION}/lua-language-server-${LUA_LS_VERSION}-linux-x64.tar.gz"
        mkdir -p ~/.local/share/lua-language-server
        tar -xzf lua-ls.tar.gz -C ~/.local/share/lua-language-server
        ln -sf ~/.local/share/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server
        rm lua-ls.tar.gz
      fi
      ;;
  esac
}

# Install Node.js if not present
install_node() {
  if ! command -v node &> /dev/null; then
    log_info "Installing Node.js..."
    case $OS in
      macos)
        brew install node
        ;;
      fedora)
        sudo dnf install -y nodejs bun
        ;;
      ubuntu)
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt install -y nodejs
        ;;
    esac
  else
    log_info "Node.js already installed: $(node --version)"
  fi
}

# Install Go if not present
install_go() {
  if ! command -v go &> /dev/null; then
    log_info "Installing Go..."
    case $OS in
      macos)
        brew install go
        ;;
      fedora)
        sudo dnf install -y golang
        ;;
      ubuntu)
        sudo apt install -y golang
        ;;
    esac
  else
    log_info "Go already installed: $(go version)"
  fi
}

# Install language servers
install_language_servers() {
  log_info "Installing language servers..."

  # Go
  if command -v go &> /dev/null; then
    log_info "Installing gopls..."
    go install golang.org/x/tools/gopls@latest
  fi

  # Node-based servers
  if command -v bun &> /dev/null; then
    log_info "Installing TypeScript, Vue, and Tailwind language servers..."
    bun install -g typescript typescript-language-server @vue/language-server @tailwindcss/language-server @astrojs/language-server
  fi
}

# Install Nerd Font
install_font() {
  log_info "Installing Nerd Font..."

  case $OS in
    macos)
      brew tap homebrew/cask-fonts 2>/dev/null || true
      brew install --cask font-fira-code-nerd-font
      ;;
    fedora|ubuntu)
      mkdir -p ~/.local/share/fonts
      cd ~/.local/share/fonts
      if [[ ! -f "FiraCodeNerdFont-Regular.ttf" ]]; then
        curl -fLo "FiraCodeNerdFont-Regular.ttf" \
          https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf
        fc-cache -fv
      else
        log_info "Nerd Font already installed"
      fi
      ;;
  esac
}

# Backup existing nvim config
backup_nvim_config() {
  if [[ -d ~/.config/nvim ]]; then
    log_warn "Existing nvim config found, backing up to ~/.config/nvim.bak"
    rm -rf ~/.config/nvim.bak
    mv ~/.config/nvim ~/.config/nvim.bak
  fi
}

# Install nvim config
install_nvim_config() {
  log_info "Installing nvim config..."

  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  mkdir -p ~/.config/nvim/lua/plugins

  cp "$SCRIPT_DIR/init.lua" ~/.config/nvim/
  cp "$SCRIPT_DIR/lua/plugins/"*.lua ~/.config/nvim/lua/plugins/
}

# Add paths to shell config
setup_paths() {
  log_info "Setting up PATH..."

  # Determine shell config file
  if [[ -f ~/.zshrc ]]; then
    SHELL_RC=~/.zshrc
  elif [[ -f ~/.bashrc ]]; then
    SHELL_RC=~/.bashrc
  else
    SHELL_RC=~/.profile
  fi

  # Go bin path
  if ! grep -q 'GOPATH' "$SHELL_RC" 2>/dev/null; then
    echo 'export GOPATH="$HOME/go"' >> "$SHELL_RC"
    echo 'export PATH="$PATH:$GOPATH/bin"' >> "$SHELL_RC"
  fi

  # Local bin path (for lua-language-server on Ubuntu)
  if ! grep -q '.local/bin' "$SHELL_RC" 2>/dev/null; then
    echo 'export PATH="$PATH:$HOME/.local/bin"' >> "$SHELL_RC"
  fi

  log_info "Added paths to $SHELL_RC"
}

# Main
main() {
  log_info "Starting Neovim setup..."

  detect_os
  install_system_packages
  install_node
  install_go
  install_language_servers
  install_font
  backup_nvim_config
  install_nvim_config
  setup_paths

  log_info "Setup complete!"
  log_info ""
  log_info "Next steps:"
  log_info "  1. Restart your terminal or run: source ~/.zshrc (or ~/.bashrc)"
  log_info "  2. Set your terminal font to 'FiraCode Nerd Font'"
  log_info "  3. Run 'nvim' - plugins will auto-install on first launch"
  log_info "  4. Run ':Copilot auth' in nvim to authenticate GitHub Copilot"
  log_info ""
}

main "$@"
