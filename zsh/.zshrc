export GPG_TTY=$TTY

## setup linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

ZSH_SCRIPTS="$HOME/.zsh.d"

## install plugins
[[ ! -f "$ZSH_SCRIPTS/.plugin.zsh" ]] || source "$ZSH_SCRIPTS/.plugin.zsh"

## import alias
[[ ! -f "$ZSH_SCRIPTS/.alias.zsh" ]] || source "$ZSH_SCRIPTS/.alias.zsh"

## bun setup
[[ ! -f "$ZSH_SCRIPTS/.bun.zsh" ]] || source "$ZSH_SCRIPTS/.bun.zsh"

## gh setup
[[ ! -f "$ZSH_SCRIPTS/.gh.zsh" ]] || source "$ZSH_SCRIPTS/.gh.zsh"

## pnpm setup
[[ ! -f "$ZSH_SCRIPTS/.pnpm.zsh" ]] || source "$ZSH_SCRIPTS/.pnpm.zsh"

## fzf setup
[[ ! -f "$ZSH_SCRIPTS/.fzf.zsh" ]] || source "$ZSH_SCRIPTS/.fzf.zsh"

## import utils
[[ ! -f "$ZSH_SCRIPTS/.utils.zsh" ]] || source "$ZSH_SCRIPTS/.utils.zsh"

## go tool directory
[[ ! -f "$ZSH_SCRIPTS/.go.zsh" ]] || source "$ZSH_SCRIPTS/.go.zsh"

## starship setup
eval "$(starship init zsh)"

# rust tool directory
source $HOME/.cargo/env

# import windows path
export PATH=$PATH:$HOME/.windows