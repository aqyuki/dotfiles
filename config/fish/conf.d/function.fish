# 選択したローカルリポジトリに移動する
function __fzf_repository_search --description "find local repository with fzf"
    set -l select (ghq list | fzf --preview 'bat --color=always (ghq root)/{}/README.*')
    [ -n "$select" ]; and cd (ghq root)/$select
    commandline -f repaint
end
bind \cr __fzf_repository_search

# 選択したディレクトリに移動する
function __fzf_change_working_directory
    set -l select (fd --type d -H -E .git -E node_modules | fzf --preview 'lsd --almost-all --color=always --icon=always --literal --tree --depth 2 {}')
    [ -n "$select" ]; and cd $select
    commandline -f repaint
end
bind \ec __fzf_change_working_directory
