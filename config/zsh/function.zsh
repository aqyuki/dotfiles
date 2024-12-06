# ghq-fzfは、ghqで管理しているリポジトリをfzfで選択して、そのディレクトリに移動する関数です．
# Ctrl-rで実行できます．
# Ref: https://qiita.com/tomoyamachi/items/e51d2906a5bb24cf1684
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :100 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^r' ghq-fzf
