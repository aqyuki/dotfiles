# ghq settings
set -x GHQ_ROOT $HOME/.projects

# fzf settings
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'

# load starship prompt
set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source