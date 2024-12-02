# ghq-fzfは、ghqで管理しているリポジトリをfzfで選択して、そのディレクトリに移動する関数です．
# Ctrl-rで実行できます．
# Ref: https://qiita.com/tomoyamachi/items/e51d2906a5bb24cf1684
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "git --git-dir $(ghq root)/{}/.git log --date=short --pretty=format:'-%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --color")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^r' ghq-fzf

# code-repoはvscodeで指定したディレクトリを開きます．
# Ctrl-shift-rで実行できます．
# Ref: https://zenn.dev/nowa0402/articles/5eb780280f2523
function code-open() {
  local repodir=$(ghq list | fzf --preview "git --git-dir $(ghq root)/{}/.git log --date=short --pretty=format:'-%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --color")
  if [ -n "$repodir" ]; then
  echo "Open VSCode Workspace: '$(ghq root)/$repodir'"
   code $(ghq root)/$repodir
   zle accept-line
  fi
  zle -R -c
}
zle -N code-open
bindkey '^R' code-open
