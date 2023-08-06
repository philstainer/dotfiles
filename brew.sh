#!/bin/bash

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }
function refresh_path  { exec "$SHELL" }

echo_ok "Install starting. You may be asked for your password (for sudo)."

# Homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if hash brew &> /dev/null; then
    echo_ok "Homebrew already installed"
else
    echo_warn "Installing homebrew..."
    #ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo_warn "Installing brew cask..."
brew tap homebrew/cask
brew tap homebrew/cask-fonts

# Pre Install Setup
echo_warn "Installing required software..."
sudo softwareupdate --install-rosetta
brew install cmake
brew install gcc
brew install llvm
brew install go
brew install luarocks # Needed for lua formatter
brew install gnupg
brew install --cask gpg-suite
brew install --cask chromedriver
brew install wget
brew install coreutils
brew install gum

# Fonts
echo_warn "Installing fonts..."
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font

# Applications
echo_warn "Installing applications..."

# Tools
brew install fzf
brew install trash
brew install jsonpp
brew install exa

# https://opensource.com/article/19/5/python-3-default-mac
brew install pyenv
brew install openssl readline sqlite3 xz zlib tcl-tk # pyenv dependencies

brew install ripgrep
brew install fd
brew install --cask shottr

# Apps
brew install --cask 1password
brew install --cask raycast
brew install --cask stats
brew install --cask iina
brew install --cask imageoptim
brew install --cask pdf-squeezer
brew install --cask ngrok
brew install --cask google-drive
brew install --cask notion

# Dev utilities
brew install git
brew install gh # Github CLI
brew install --cask github
brew install --cask visual-studio-code
brew install --cask sourcetree

# Browsers
brew install --cask google-chrome

# Communication
brew install --cask discord
brew install --cask microsoft-outlook
brew install --cask whatsapp

# Terminal
echo_warn "Installing Terminal..."
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/baliestri/pnpm.plugin.zsh ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/pnpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install fig

# Install Mac App Store
echo_warn "Installing Mac Apps..."
brew install mas

mas install 497799835  # Xcode
mas install 1607635845 # Velja

# Clean up
brew cleanup

refresh_path

pyenv install 2.7:latest
pyenv install 3:latest

refresh_path

echo
echo_ok "Done."
echo
