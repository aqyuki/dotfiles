# environment
#
# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# XDG_BIN_HOMEにはカスタムスクリプトやバイナリファイルが配置されているため、PATHを通す
# zshではPATHが配列として扱うことができるため、以下の書き方で追加する
# ref : https://anatofuz.hatenablog.com/entry/2023/01/08/153838
path+=("$XDG_BIN_HOME")

# Editor
export EDITOR="nvim"

# Export language environment
#
# Go
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
path+=("/usr/local/go/bin" "$GOBIN")

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
source $CARGO_HOME/env
