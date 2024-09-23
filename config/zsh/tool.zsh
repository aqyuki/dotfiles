# Tool configurations
## Original script
export PATH=$PATH:$HOME/.local/bin

## Rust configuration
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

## Go configuration
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"

## Bun configuration
export BUN_INSTALL=$XDG_DATA_HOME/bun
export PATH=$PATH:$BUN_INSTALL/bin
[ -s "$XDG_DATA_HOME/bun/_bun" ] && source "$XDG_DATA_HOME/bun/_bun"

## mise shims
export PATH="$XDG_DATA_HOME/mise/shims:$PATH"

eval "$(gh completion --shell zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(dblab completion zsh)"
eval "$(pueue completions zsh)"
eval "$(octocov completion zsh)"
eval "$(ngrok completion zsh)"
eval "$(mise activate zsh)"
eval "$(mise completion zsh)"
eval "$(lefthook completion zsh)"

# Taskfile
fpath=( $XDG_COMPLETION_HOME "${fpath[@]}" )
autoload -Uz _task

# fzf - ghq
export GHQ_ROOT=$XDG_DATA_HOME/source
function repo-find() {
  local src=$(ghq list | fzf)
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N repo-find
bindkey '^g' repo-find
