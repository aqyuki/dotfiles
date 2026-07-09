# Homebrew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# XDG Base Directory Specification
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_DATA_HOME $HOME/.local/share

# Disable greeting message
set fish_greeting

# GnuPG settings
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Go
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
fish_add_path /usr/local/go/bin
fish_add_path $GOBIN

# starship
starship init fish | source

# ghq
set -gx GHQ_ROOT $HOME/projects

# gwq
gwq completion fish | source

# fzf
set -gx FZF_DEFAULT_OPTS "--height 50% --layout reverse --border rounded"

# mise
mise activate fish | source
mise activate fish --shims | source

# uv
uv generate-shell-completion fish | source

# Codex CLI
codex completion fish | source

# abbr
abbr --add --global lg lazygit
abbr --add --global proot 'cd (git rev-parse --show-toplevel)'
abbr --add --global --command git pf 'push --force-if-includes  --force-with-lease'

# hotkeys
bind \cg __fzf_repository_find
