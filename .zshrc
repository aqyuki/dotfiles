export GPG_TTY=$(tty)

# Load Alias
[[ ! -f $XDG_CONFIG_HOME/zsh/alias.zsh ]] || source $XDG_CONFIG_HOME/zsh/alias.zsh

# Load Tool configuration
[[ ! -f $XDG_CONFIG_HOME/zsh/tool.zsh  ]] || source $XDG_CONFIG_HOME/zsh/tool.zsh

# Load plugins
[[ ! -f $XDG_CONFIG_HOME/zsh/plugin.zsh ]] || source $XDG_CONFIG_HOME/zsh/plugin.zsh

# Load hooks
[[ ! -f $XDG_CONFIG_HOME/zsh/hook.zsh ]] || source $XDG_CONFIG_HOME/zsh/hook.zsh

# zsh config
autoload -Uz compinit && compinit
