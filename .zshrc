export GPG_TTY=$(tty)

#========== Alias ==============================#
alias ls='lsd'
alias lg='lazygit'
alias task='go-task'

#========== Language ===========================#

##========= Rust ==============================##
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

##========= Go ================================##
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"

##========= Bun ===============================##
export BUN_INSTALL=$XDG_DATA_HOME/bun
export PATH=$PATH:$BUN_INSTALL/bin
[ -s "/home/aqyuki/.local/share/bun/_bun" ] && source "/home/aqyuki/.local/share/bun/_bun"

#========== Scripts ============================#
export PATH=$PATH:$HOME/.local/bin

#========== Plugins ============================#
if [[ ! -f $XDG_DATA_HOME/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$XDG_DATA_HOME/zinit" && command chmod g-rwX "$XDG_DATA_HOME/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$XDG_DATA_HOME/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$XDG_DATA_HOME/zinit/zinit.git/zinit.zsh"

zinit ice depth=1;
zinit light zdharma-continuum/zinit-annex-as-monitor
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl
zinit light zdharma-continuum/zinit-annex-rust
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light romkatv/powerlevel10k
[[ ! -f $XDG_DATA_HOME/dotfiles/.p10k.zsh ]] || source $XDG_DATA_HOME/dotfiles/.p10k.zsh

#========== zsh ===============================#
autoload -Uz compinit && compinit

#========== Tool ==============================#

##========= fzf ===============================##
eval "$(fzf --zsh)"
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

##========= ghq ===============================##
export GHQ_ROOT=$XDG_DATA_HOME/source

##========= gh ================================##
eval "$(gh completion --shell zsh)"

##========= fnm ===============================##
FNM_PATH="/home/aqyuki/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/aqyuki/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
eval "$(fnm completions --shell zsh)"

#========= utils ==============================#
function ghq-fzf() {
  local src=$(ghq list | fzf  --color --preview "git --git-dir $(ghq root)/{}/.git log --date=short --pretty=format:'%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf

