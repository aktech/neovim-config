#!/bin/bash

# Ubuntu/Debian Installation Script for NvChad Neovim Configuration
# This script installs all required dependencies and sets up the Neovim configuration

set -e

echo "🚀 Installing NvChad Neovim Configuration for Ubuntu/Debian"
echo "============================================================"

# Update package list
echo "📦 Updating package list..."
sudo apt update

# Install system dependencies
echo "🔧 Installing system dependencies..."
sudo apt install -y \
    curl \
    git \
    wget \
    unzip \
    build-essential \
    gcc \
    make \
    cmake \
    pkg-config \
    libtool \
    autoconf \
    automake \
    gettext \
    python3 \
    python3-pip \
    nodejs \
    npm \
    golang-go \
    lua5.1 \
    luarocks \
    ripgrep \
    fd-find \
    fzf \
    shellcheck

# Install Neovim (latest stable)
echo "📝 Installing Neovim..."
if ! command -v nvim &> /dev/null; then
    # Download and install latest Neovim AppImage
    wget -O /tmp/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod +x /tmp/nvim.appimage
    sudo mv /tmp/nvim.appimage /usr/local/bin/nvim

    # Alternative: Install via snap if AppImage doesn't work
    # sudo snap install nvim --classic
fi

# Install language servers and tools via npm
echo "🌐 Installing Node.js language servers..."
sudo npm install -g \
    @microsoft/compose-language-service \
    bash-language-server \
    typescript-language-server \
    vscode-langservers-extracted \
    dockerfile-language-server-nodejs

# Install Go language servers
echo "🔷 Installing Go language servers..."
go install github.com/docker/docker-language-server/cmd/docker-language-server@latest
go install golang.org/x/tools/gopls@latest

# Install Python tools
echo "🐍 Installing Python tools..."
pip3 install --user \
    pyrefly \
    ruff \
    python-lsp-server[all]

# Install Rust and rust-analyzer (if not already installed)
echo "🦀 Installing Rust and rust-analyzer..."
if ! command -v rustc &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source ~/.cargo/env
fi
if ! command -v rust-analyzer &> /dev/null; then
    rustup component add rust-analyzer
fi

# Install additional tools (optional but recommended)
echo "🛠️  Installing additional tools..."
# Lazygit for git management
if ! command -v lazygit &> /dev/null; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit.tar.gz lazygit
fi

# Install terminal image viewers
if ! command -v chafa &> /dev/null; then
    sudo apt install -y chafa
fi

# Backup existing Neovim configuration
echo "💾 Backing up existing configuration..."
if [ -d ~/.config/nvim ]; then
    echo "⚠️  Existing Neovim configuration found. Creating backup..."
    mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
fi

# Clone this configuration
echo "📥 Cloning Neovim configuration..."
mkdir -p ~/.config
git clone https://github.com/aktech/nvim ~/.config/nvim

# Set up PATH for Go binaries
echo "🔧 Setting up PATH..."
if ! grep -q 'export PATH=$PATH:$(go env GOPATH)/bin' ~/.bashrc; then
    echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
fi

if ! grep -q 'export PATH=$PATH:~/.cargo/bin' ~/.bashrc; then
    echo 'export PATH=$PATH:~/.cargo/bin' >> ~/.bashrc
fi

if ! grep -q 'export PATH=$PATH:~/.local/bin' ~/.bashrc; then
    echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
fi

# Source the updated bashrc
source ~/.bashrc || true

echo "✅ Installation completed!"
echo ""
echo "🎉 Next steps:"
echo "1. Restart your terminal or run: source ~/.bashrc"
echo "2. Start Neovim: nvim"
echo "3. Wait for plugins to install automatically"
echo "4. Run :checkhealth to verify everything is working"
echo ""
echo "📚 Useful commands:"
echo "- :Lazy - Manage plugins"
echo "- :Mason - Manage language servers"
echo "- :checkhealth - Check system health"
echo ""
echo "If you encounter any issues, please check the CLAUDE.md file for troubleshooting."