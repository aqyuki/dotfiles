__fzf_find_repository(){
  local src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N __fzf_find_repository
bindkey '^g' __fzf_find_repository

# zsh
autoload -U compinit
compinit

# ghq
export GHQ_ROOT="$HOME/projects"

eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--height 50% --layout reverse --border rounded"

# mise
eval "$(mise activate zsh)"

# zabrze
eval "$(zabrze init --bind-keys)"

# sheldon
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"
