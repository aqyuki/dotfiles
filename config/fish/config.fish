# Common environment variable
set --export EDITOR nvim

# XDG Base Directory
set --export XDG_CONFIG_HOME $HOME/.config
set --export XDG_DATA_HOME $HOME/.local/share
set --export XDG_STATE_HOME $HOME/.local/state
set --export XDG_CACHE_HOME $HOME/.cache

# XDG_BIN_HOMEはカスタムスクリプトなどを配置するためのディレクトリ
set --export XDG_BIN_HOME $HOME/.local/bin
fish_add_path $XDG_BIN_HOME

# Go
set --unexport GO_INSTALL_PATH /usr/local/go
set --export GOPATH $XDG_DATA_HOME/go
set --export GOBIN $GOPATH/bin
fish_add_path $GO_INSTALL_PATH/bin
fish_add_path $GOBIN

# Rust
set --export RUSTUP_HOME $XDG_DATA_HOME/rustup
set --export CARGO_HOME $XDG_DATA_HOME/cargo
source $XDG_DATA_HOME/cargo/env.fish
rustup completions fish | source

# mise
mise activate fish | source
mise completion fish | source

## mise managed
## miseによって管理されているツールの初期化処理
task --completion fish | source

# GHQ
set --export GHQ_ROOT $HOME/projects

# fzf
set --export FZF_DEFAULT_OPTS '--height 50% --reverse --border=rounded'

# Custom shortcuts
bind \cr __fzf_repository_search
bind \cf __fzf_change_working_directory

# Abbreviations
abbr --add lg lazygit
abbr --add proot 'cd (git rev-parse --show-toplevel)'

# Prompt
# 通常と異なるディレクトリにStarshipの設定ファイルが存在するため、環境変数で設定ファイルを明示的に指定
set --export STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
starship init fish | source

# Interactive mode
#
# Interactive shellでのみ実行される
if status is-interactive
end
