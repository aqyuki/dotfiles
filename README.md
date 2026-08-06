# dotfiles

[mise](https://mise.jdx.dev/)のBootstrap機能を利用してdotfilesを管理しています。

## Setup

```bash
# 1. Homebrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$()"

# 2. dotfilesのClose
git clone https://github.com/aqyuki/dotfiles.git ~/.dotfiles
cd .dotfiles

# 3. mise bootstrapの実行
mise trust
mise bootstrap

# 4. 開発ツールのインストール
# Rust / Goのインストール完了後
mise install

```

## Tips

### パッケージの同期

dotfilesではHomebrew上のパッケージはmiseで管理し、CaskのパッケージはHomebrewでの直接管理を行っています。以下のタスクを実行することで各種パッケージを同期することができます。

```bash
mise run sync-packages
```
