#! /bin/zsh

function peco-repositories () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-repositories
bindkey '^g' peco-repositories

function zsh-plugin-update () {
  echo "Update zsh plugins..."
  zinit update --all
  echo "Recommend to reload .zshrc"
}