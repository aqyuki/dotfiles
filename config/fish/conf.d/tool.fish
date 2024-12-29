# Go
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $GOPATH/bin
fish_add_path /usr/local/go/bin
fish_add_path $GOPATH/bin

# Rust
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo

# ghq settings
set -x GHQ_ROOT $HOME/.projects

# fzf settings
set -x FZF_DEFAULT_OPTS '--height 50% --reverse --border=rounded'

# fnm
set -x FNM_PATH "$XDG_DATA_HOME/fnm"
fish_add_path "$FNM_PATH"

fnm env --use-on-cd --shell fish | source
fnm completions --shell fish | source

# zoxide settings
zoxide init fish | source
set -x _ZO_FZF_OPTS '--height 50% --reverse --border=rounded'

# GitHub CLI
gh completion -s fish | source

# direnv
direnv hook fish | source

# pnpm
set -x PNPM_HOME $XDG_DATA_HOME/pnpm
fish_add_path $PNPM_HOME
pnpm setup >>/dev/null

# load starship prompt
set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
