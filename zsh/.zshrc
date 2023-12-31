export GPG_TTY=$TTY

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## setup linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

ZSH_SCRIPTS="$HOME/.zsh.d"

## install plugins
[[ ! -f "$ZSH_SCRIPTS/.plugin.zsh" ]] || source "$ZSH_SCRIPTS/.plugin.zsh"

## import alias
[[ ! -f "$ZSH_SCRIPTS/.alias.zsh" ]] || source "$ZSH_SCRIPTS/.alias.zsh"

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$ZSH_SCRIPTS/.p10k.zsh" ]] || source "$ZSH_SCRIPTS/.p10k.zsh"

## asdf setup
[[ ! -f "$ZSH_SCRIPTS/.asdf.zsh" ]] || source "$ZSH_SCRIPTS/.asdf.zsh"

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

# rust tool directory
source $HOME/.cargo/env

# import windows path
export PATH=$PATH:$HOME/.windows