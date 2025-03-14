#!/bin/bash

set -eu

# variables
script_dir=$(cd $(dirname $0) && pwd)
config_dir=$HOME/.config
package_list="$(sort "$script_dir/packages.txt" | xargs)"

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

# show_meta shows the meta information
show_meta() {
  local author="aqyuki"
  local repository="https://github.com/aqyuki/dotfiles"

  log "============================================="
  log "dotfiles installer feat. $author"
  log "Author: $author"
  log "Repository: $repository"
  log "============================================="
  log "script_dir: $script_dir"
  log "config_dir: $config_dir"
  log "$(wc -w <<<"$package_list") packages will be installed."
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

# remove_symlink removes a symbolic link
remove_symlink() {
  local link=$1

  # リンクが存在する場合は削除
  if [ -L "$link" ]; then
    rm "$link"
    log "${BLUE}Removed${RESET} : $link"
  fi
}

# install_configurations installs dotfiles
install_configurations() {
  # if ~/.config does not exist, create it
  if [ ! -d "$config_dir" ]; then
    info "$config_dir does not exist. Create it."
    mkdir -p "$config_dir"
    info "created $config_dir"
  fi

  # dotfiles installer
  for dir in "$script_dir/config"/*/; do
    local dir_name=$(basename "$dir")
    local link_path="$config_dir/$dir_name"
    create_symlink "$dir" "$link_path"
  done

  for file_name in "$(ls -A "$script_dir/home")"; do
    local file_path="$script_dir/home/$file_name"
    local link_path="$HOME/$file_name"
    create_symlink "$file_path" "$link_path"
  done
}

# install_dependency installs a package
install_dependency() {
  local missing_packages=()

  for package in $(cat "$script_dir/packages.txt"); do
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

# install tmux theme
#
# TPM(tmux plugin manager)を使用せずに手動でThemeをインストール
# Install directory : $HOME/.local/share/tmux/plugins/catppuccin
install_tmux_plugins(){
  # local tmux_plugin_dir="$XDG_DATA_HOME/tmux/plugins"
  local tmux_plugin_dir="$HOME/.local/share/tmux/plugins"

  # ディレクトリが存在しない場合には作成
  if [ ! -d "$tmux_plugin_dir" ]; then
    info "$tmux_plugin_dir does not exist. Create it."
    mkdir -p "$tmux_plugin_dir"
    info "created $tmux_plugin_dir"
  fi

  # catppuccin theme
  # Ref : https://github.com/catppuccin/tmux
  if [ ! -d "$tmux_plugin_dir/catppuccin" ]; then
    info "Installing catppuccin/tmux"
    git clone https://github.com/catppuccin/tmux.git "$tmux_plugin_dir/catppuccin"
    info "Installed catppuccin/tmux"
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

usage() {
  log "Usage: $0 [ usage | install | uninstall | sync ]"
  log "  usage      : show this message"
  log "  install    : install dotfiles"
  log "  uninstall  : uninstall dotfiles"
  log "  sync       : install dependencies"
}

install() {
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

uninstall() {
  # uninstall dotfiles
  info "Start to uninstall dotfiles..."
  for dir in "$script_dir/config"/*/; do
    local dir_name=$(basename "$dir")
    local link_path="$config_dir/$dir_name"

    # remove symlink
    remove_symlink "$link_path"
  done
  info "Dotfiles are successfully uninstalled."

  # cleanup
  info "Start to cleanup..."
  cleanup
  info "Cleanup is successfully done."
}

list-dependency() {
  log "$(wc -w <packages.txt) packages are counted by dependencies in packages.txt"
  for package in $(cat "$script_dir/packages.txt"); do
    if yay -Qi $package >/dev/null 2>&1; then
      log "${BLUE}Installed${RESET} : $package"
    else
      log "${RED}Not installed${RESET} : $package"
    fi
  done
  info "Dependency check complete."
}

# entrypoint
show_meta
case "$1" in
usage)
  usage
  ;;
install)
  install "$@"
  ;;
uninstall)
  uninstall "$@"
  ;;
sync)
  install_dependency
  ;;
packages)
  list-dependency
  ;;
*)
  error "Invalid command: $1"
  exit 1
  ;;
esac
