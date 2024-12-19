# Go
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $GOPATH/bin
fish_add_path /usr/local/go/bin
fish_add_path $GOPATH/bin

# Rust
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo

# ghq settings
set -x GHQ_ROOT $HOME/.projects

# fzf settings
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'

# mise settings
mise activate fish | source
mise completion fish | source

# load starship prompt
set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
