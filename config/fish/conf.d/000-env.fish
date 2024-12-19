# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_BIN_HOME $HOME/.local/bin

# Path
fish_add_path $XDG_BIN_HOME

# Cargo
source $XDG_DATA_HOME/cargo/env.fish
