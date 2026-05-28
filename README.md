# dotfiles

## About

[しろね](https://github.com/aqyuki)の開発環境を管理しているリポジトリです。

## Environment

- OS : MacOS
- Shell : fish
- Terminal : Ghostty

## Setup

このリポジトリで管理している設定ファイルを `$XDG_CONFIG_HOME` もしくは `$HOME/.config` もしくは `$HOME/.config` に配置する。

`link.sh`の詳細を確認したい場合は `./scripts/link.sh --help` を実行してください。

```bash
git clone https://github.com/aqyuki/dotfiles
cd dotfiles

chmod +x scripts/link.sh
./scripts/link.sh
```

## Homebrew

[`Brewfile`](./Brewfile)を更新する際には以下のコマンドを実行する。

```bash
brew bundle dump --no-go --no-cargo --no-vscode --force
```

Brewfileに記載されているパッケージをインストールする場合は以下のコマンドを実行する。

```bash
brew bundle
```
