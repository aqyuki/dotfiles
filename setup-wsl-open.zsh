# setup xdg-open
bun install -g wsl-open
sudo ln -s $(which wsl-open) /usr/local/bin/xdg-open
