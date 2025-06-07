#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

readonly XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
readonly XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
readonly XDG_BIN_DIR="${XDG_BIN_DIR:-$XDG_DATA_HOME/bin}"

readonly CONFIG_DIR="${SCRIPT_DIR}/config"

readonly PACKAGES=(
  "git"
  "curl"
  "neovim"
  "fish"
  "starship"
  "github-cli"
  "lazygit"
  "ghq"
  "fzf"
  "bat"
  "fd"
  "lsd"
  "ripgrep"
  "tokei"
  "git-delta"
  "bottom"
  "duf"
  "pueue"
  "procs"
  "mise"
)

function install() {
  printf "install dependencies\n"

  if ! command -v yay >/dev/null 2>&1; then
    printf "yay is not found. Install it.\n"

    tmp="$(mktemp -d)"
    git clone https://aur.archlinux.org/yay.git "$tmp/yay"
    makepkg --syncdeps --rmdeps --install --clean --cleanbuild --dir "$tmp/yay" --noconfirm

    printf "yay is installed\n"
  fi
  printf "yay version : %s\n" "$(yay --version)"

  # upgrate system and install dependencies
  yay -Sy
  yay -S --needed "${PACKAGES[@]}"
}

function deploy() {
  printf "deploy configuration\n"

  for item in "$CONFIG_DIR"/*; do
    name=$(basename "$item")

    src="${CONFIG_DIR}/${name}"
    dst="${XDG_CONFIG_HOME}/${name}"

    if [[ -e "$src" ]]; then
      if [[ -L "$dst" || -e "$dst" ]]; then
        printf "[Skip] %s -> %s\n" "$item" "$dst"
      else
        ln -s "$src" "$dst"
        printf "[Linked] %s -> %s\n" "$src" "$dst"
      fi
    else
      printf "[Skip] %s: source %s does not exist.\n" "$item" "$src"
    fi
  done
}

# main function

case "$1" in
"")
  install
  deploy
  ;;
install)
  install
  ;;
deploy)
  deploy
  ;;
*)
  printf "unknown command : %s\n" "$1"
  ;;
esac
