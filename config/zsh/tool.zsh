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
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "git --git-dir $(ghq root)/{}/.git log --date=short --pretty=format:'-%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --color")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf
