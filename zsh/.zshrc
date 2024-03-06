export GPG_TTY=$TTY

# Import plugins

## zinit
if [[ -f $DOTFILE_ZSH_PLUGIN/zinit.zsh ]]; then
  source $DOTFILE_ZSH_PLUGIN/zinit.zsh
fi

## plugins
if [[ -f $DOTFILE_ZSH_PLUGIN/plugin.zsh ]]; then
  source $DOTFILE_ZSH_PLUGIN/plugin.zsh
fi

# linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# gh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias
if [[ -f $DOTFILE_ROOT/zsh/alias.zsh ]]; then
  source $DOTFILE_ROOT/zsh/alias.zsh
fi

# Go settings
export GOROOT=$RUNTIME_ROOT/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$RUNTIME_ROOT/go/bin:$GOBIN

# Rust settings
export CARGO_HOME=$RUNTIME_ROOT/rust/.cargo
export RUSTUP_HOME=$RUNTIME_ROOT/rust/.rustup
source $RUNTIME_ROOT/rust/.cargo/env

# Bun.js settings
export BUN_INSTALL=$RUNTIME_ROOT/bun
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$RUNTIME_ROOT/bun/_bun" ] && source "$RUNTIME_ROOT/bun/_bun"

# load utils
if [[ -f $DOTFILE_ROOT/zsh/utils.zsh ]]; then
  source $DOTFILE_ROOT/zsh/utils.zsh
fi

# mise
eval "$(mise activate zsh)"

# enable direnv
eval "$(direnv hook zsh)"

typeset -U PATH
