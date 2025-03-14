function __fzf_change_working_directory() {
  local select
  select=$(fd --type d -H -E .git -E node_modules | fzf --preview 'lsd --almost-all --color=always --icon=always --literal --tree --depth 2 {}')
  if [ -n "$select" ]; then
    BUFFER="cd '$select'"
    zle accept-line
  fi
  zle -R -c
}
zle -N __fzf_change_working_directory
bindkey '^f' __fzf_change_working_directory

function __fzf_repository_search() {
  local src
  src=$(ghq list | fzf --preview "lsd --almost-all --color=always --ignore-glob='.git' --literal --tree --depth 2 $(ghq root)/{}")
  if [ -n "$src" ]; then
    BUFFER="cd '$(ghq root)/$src'"
    zle accept-line
  fi
  zle -R -c
}
zle -N __fzf_repository_search
bindkey '^r' __fzf_repository_search
