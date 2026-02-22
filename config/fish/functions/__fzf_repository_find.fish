function __fzf_repository_find -d "fzfを用いてghqで管理されているリポジトリを検索する"
    set -l src (ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 (ghq root)/{}/README.*")
    if test -n "$src"
        cd (ghq root)/$src
    end
    commandline -f repaint
end
