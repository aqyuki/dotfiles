# dotfiles

## About

[しろね](https://github.com/aqyuki)の開発環境を管理しているリポジトリです。

## Environment

- OS : MacOS
- Shell : fish
- Terminal : Ghostty

## Installation

`install.sh`を実行することで、各種設定を**XDG Base Directory Specification**に基づいて配置します。
このスクリプトではHomebrew等のインストールは行わないため、別途インストールが必要となります。

## Tips

### Brewfile

Homebrewで管理されているアプリケーションは[Brewfile](./Brewfile)で管理されています。
BrewfileにはHomebrewで管理されているアプリケーションのみ含まれておりVSCodeの拡張機能等は含まれていません。

Brewfileを更新する場合は以下のコマンドを実行してください。
```bash
brew bundle dump --no-vscode --no-go --no-cargo --force

# miseを導入している場合は以下のコマンドでも可能
mise trust
mise task bundle
```
