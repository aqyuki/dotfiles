#! /bin/zsh

zsh_script_root="zsh"
zsh_script_dir=".zsh.d"

# Install zsh config
## get install script directory
script_dir="$(cd "$( dirname "${(%):-%x}" )" && pwd)"
## get file list
file_list=(find $script_dir/$zsh_script_root/$zsh_script_dir/)

# create .symbolic links
ln -s $script_dir/$zsh_script_root/.zshrc $HOME/.zshrc
ln -s $script_dir/$zsh_script_root/$zsh_script_dir $HOME/

# Install git config
## copy config file
ln -s $script_dir/git/.gitconfig $HOME/.gitconfig
touch $HOME/.gitconfig.local

# Install tool config
## copy config file
ln -s $script_dir/lazygit/config.yml $HOME/.config/lazygit/config.yml
ln -s $script_dir/starship/starship.toml $HOME/.config/starship.toml

# create .symbolic links
ln -s $script_dir/nvim $HOME/.config/