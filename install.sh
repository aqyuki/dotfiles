#!/bin/bash

set -eu

# XDG base directory specification
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

# variables
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
PACKAGE_LIST="$(sort "$SCRIPT_DIR/packages.txt" | xargs)"

# color codes
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RED="\033[1;31m"
RESET="\033[0m"

# common utilities
log() { echo -e "$1"; }

info() { echo -e "${BLUE}[INFO]${RESET} $1"; }

warn() { echo -e "${YELLOW}[WARN]${RESET} $1"; }

error() { echo -e "${RED}[ERROR]${RESET} $1"; }

# create_symlink creates a symbolic link
create_symlink() {
  local src=$1
  local dest=$2

  # 既存のリンクやディレクトリがある場合はスキップ
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    warn "Skip: $dest already exists."
    return
  fi

  # シンボリックリンクを作成
  ln -s "$src" "$dest"
  log "${BLUE}Linked${RESET} : $src -> $dest"
}

# show_meta shows the meta information
show_meta() {
  local author="aqyuki"
  local repository="https://github.com/aqyuki/dotfiles"

  log "============================================="
  log "dotfiles installer feat. $author"
  log "Author: $author"
  log "Repository: $repository"
  log "============================================="
  log "SCRIPT_DIR: $SCRIPT_DIR"
  log "XDG_CONFIG_DIR: $XDG_CONFIG_HOME"
  log "$(wc -w <<<"$PACKAGE_LIST") packages will be installed."
  log "============================================="
}

# doctor checks the installer dependencies
doctor() {
  # check the installer dependencies
  local dependencies=(yay git)
  for dep in "${dependencies[@]}"; do
    if ! command -v "$dep" &>/dev/null; then
      error "$dep is not installed. Please install it."
      exit 1
    fi
  done
}

# install_configurations installs dotfiles
install_configurations() {
  # if ~/.config does not exist, create it
  if [ ! -d "$XDG_CONFIG_HOME" ]; then
    info "$XDG_CONFIG_HOME does not exist. Create it."
    mkdir -p "$XDG_CONFIG_HOME"
    info "created $XDG_CONFIG_HOME"
  fi

  # dotfiles installer
  for dir in $(ls --almost-all "$SCRIPT_DIR/config"); do
    local dir_name=$(basename "$dir")
    local link_path="$XDG_CONFIG_HOME/$dir_name"
    create_symlink "$SCRIPT_DIR/config/$dir" "$link_path"
  done
}

# install_dependency installs a package
install_dependency() {
  local missing_packages=()

  # PACKAGE_LISTを配列として認識させるには""で囲ってはいけない
  for package in $PACKAGE_LIST; do
    if ! yay -Qi $package >/dev/null 2>&1; then
      missing_packages+=("$package")
    else
      warn "$package is already installed."
    fi
  done

  if [ ${#missing_packages[@]} -ne 0 ]; then
    info "Installing missing packages..."
    yay -S --needed --noconfirm "${missing_packages[@]}"
  fi
}

install_tmux_plugins(){
  local tmux_plugin_dir="$XDG_DATA_HOME/tmux/plugins"

  if [ ! -d "$tmux_plugin_dir" ]; then
    info "$tmux_plugin_dir does not exist. Create it."
    mkdir -p "$tmux_plugin_dir"
    info "created $tmux_plugin_dir"
  fi

  # OneDark theme
  # Ref : https://github.com/odedlaz/tmux-onedark-theme
  if [ ! -d "$tmux_plugin_dir/onedark" ]; then
    info "Installing odedlaz/tmux-onedark-them"
    git clone https://github.com/odedlaz/tmux-onedark-theme.git "$tmux_plugin_dir/onedark"
    info "Installed odedlaz/tmux-onedark-the"
  else
    warn "Skip : odedlaz/tmux-onedark-theme is already installed"
  fi
  # catppuccin theme
  # Ref : https://github.com/catppuccin/tmux
  if [ ! -d "$tmux_plugin_dir/catppuccin" ]; then
    info "Installing catppuccin/tmux"
    git clone https://github.com/catppuccin/tmux.git "$tmux_plugin_dir/catppuccin"
    info "Installed catppuccin/tmux"
  else
    warn "Skip : catppuccin/tmux is already installed."
  fi
}

# cleanup removes unused packages
cleanup() {
  if yay -Qdtq >/dev/null; then
    local unused_packages=$(sort <(yay -Qdtq) | xargs)

    info "Removing unused packages... "
    info "Following packages will be removed: $unused_packages"
    sudo yay -Rns --noconfirm "$unused_packages"
  else
    warn "No unused packages to remove."
  fi
}

main() {
  show_meta

  # check dependencies
  info "checking installer dependencies..."
  doctor
  info "All dependencies are installed. Continue to install."

  # install dependencies
  info "Start to install dependencies..."
  install_dependency
  info "Dependencies are successfully installed."

  # install external dependencies
  #
  # install tmux plugin
  info "Start to install tmux plugins..."
  install_tmux_plugins
  info "Plugins are successfully installed."

  # install dotfiles
  info "Start to install dotfiles..."
  install_configurations
  info "Dotfiles are successfully installed."

  # cleanup
  info "Start to cleanup..."
  cleanup
  info "Cleanup is successfully done."
}
main

