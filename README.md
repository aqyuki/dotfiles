# dotfiles

[しろね](https://github.com/aqyuki)の dotfiles です。

## Environment

- OS : Mac
- Terminal : Ghostty
- Package manager : Homebrew
- Shell : zsh

## Install

> [!NOTE]
> 事前に Homebrew を導入してください。

```bash
git clone https://github.com/aqyuki/dotfiles .dotfiles
cd .dotfiles
./install.sh
```

## Tips

### Update Brewfile

Homebrew経由で新しいソフトを導入した際には以下のコマンドを実行することで`Brewfile`が更新されます。

```bash
brew bundle dump -f
```