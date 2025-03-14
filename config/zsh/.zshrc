# activate completion
autoload -Uz compinit && compinit

# load utilities
[ -f "$ZDOTDIR/util.zsh" ] && source "$ZDOTDIR/util.zsh"

# rustup completion
eval "$(rustup completions zsh)"

# mise settings
#
# Ref : https://mise.jdx.dev/installing-mise.html#zsh
eval "$(mise activate zsh)"
eval "$(mise completion zsh)"

# task settings
eval "$(task --completion zsh)"

# ghq settings
export GHQ_ROOT="$HOME/.projects"

# fzf settings
export FZF_DEFAULT_OPTS="--height 50% --reverse --border=rounded"

# starship settings
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
eval "$(starship init zsh)"
