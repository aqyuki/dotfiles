#!/bin/bash

set -ueo pipefail
shopt -s nullglob dotglob

# Constants
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"
CONFIG_SOURCE=("$SCRIPT_DIR/config/"*)
HOME_SOURCE=("$SCRIPT_DIR/home/"*)

# Utility
test_cmd(){
  local cmd="$1"

  if [ -z "$cmd" ]; then
    echo "コマンド名は必須です。"
    exit 1
  fi

  if !(type "$cmd" > /dev/null 2>&1); then
    echo "$cmdがインストールされていません。"
    exit 2
  fi

  echo "$cmd はインストールされています。"
}

create_dir_if_not_exist(){
  local target="$1"

  if [ ! -d "$target" ]; then
    echo "ディレクトリが存在しません: $target"
    echo "作成します..."
    mkdir -p "$target"
    echo "ディレクトリを作成"
  else
    echo "ディレクトリはすでに存在します: $target"
  fi
}

create_symlink(){
  local src="$1"
  local dst="$2"

  ln -sfn "$src" "$dst"
  echo "Linked : $src -> $dst"
}

# Functions
install_tools(){
  test_cmd "brew"
  brew bundle
}

prepare_deploy(){
  create_dir_if_not_exist "$XDG_CONFIG_HOME"
}

deploy_config(){
  for entry in "${CONFIG_SOURCE[@]}"; do
    local name="$(basename "$entry")"
    create_symlink "$SCRIPT_DIR/config/$name" "$XDG_CONFIG_HOME/$name"
  done
}

deploy_home(){
  for entry in "${HOME_SOURCE[@]}"; do
    local name="$(basename "$entry")"
    create_symlink "$SCRIPT_DIR/home/$name" "$HOME/$name"
  done
}

deploy(){
  deploy_config
  deploy_home
}

# Entry point
__main(){
  install_tools
  prepare_deploy
  deploy
}
__main "$@"