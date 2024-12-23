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
set -x FZF_DEFAULT_OPTS '--height 50% --reverse --border=rounded'

# zoxide settings
zoxide init fish | source
set -x _ZO_FZF_OPTS '--height 50% --reverse --border=rounded'

# GitHub CLI
gh completion -s fish | source

# load starship prompt
set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
