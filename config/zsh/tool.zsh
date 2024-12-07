autoload -Uz compinit
compinit

# zsh
setopt auto_cd

# Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$XDG_DATA_HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
eval "$(rustup completions zsh)"
fpath=($fpath $RUSTUP_HOME/toolchains/stable-x86_64-unknown-linux-gnu/share/zsh/site-functions)

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

# fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --preview "head -100 {}"'

# podman
eval $(podman completion zsh)
