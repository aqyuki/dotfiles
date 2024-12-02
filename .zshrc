export GPG_TTY=$(tty)

# Load Alias
[[ ! -f $XDG_CONFIG_HOME/zsh/alias.zsh ]] || source $XDG_CONFIG_HOME/zsh/alias.zsh

# Load Tool configuration
[[ ! -f $XDG_CONFIG_HOME/zsh/tool.zsh  ]] || source $XDG_CONFIG_HOME/zsh/tool.zsh

# Load plugins
[[ ! -f $XDG_CONFIG_HOME/zsh/plugin.zsh ]] || source $XDG_CONFIG_HOME/zsh/plugin.zsh

# Load custom functions
[[ ! -f $XDG_CONFIG_HOME/zsh/function.zsh ]] || source $XDG_CONFIG_HOME/zsh/function.zsh

# zsh config
autoload -Uz compinit && compinit

# Launch zellij
eval "$(zellij setup --generate-auto-start zsh)"
