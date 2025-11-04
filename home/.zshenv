# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Go
export GOHOME="$HOME/go"
export GOBIN="$GOHOME/bin"
export PATH="$PATH:$GOBIN"

# Rust
source "$HOME/.cargo/env"
