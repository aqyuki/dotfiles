autoload -Uz compinit
compinit

# Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$XDG_DATA_HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# mise
eval "$(mise activate zsh)"
eval "$(mise completion zsh)"

# starship
eval "$(starship init zsh)"

# ghq
export GHQ_ROOT=$HOME/.projects

# gup
eval "$(gup completion zsh)"

# taskfile
eval "$(task --completion zsh)"
