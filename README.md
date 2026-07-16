# dotfiles

## About

[しろね](https://github.com/aqyuki)の開発環境を管理しているリポジトリです。

## Environment

- OS : MacOS
- Shell : fish
- Terminal : Ghostty

## Setup

dotfilesはmiseによって管理されています。現時点では設定ファイルの配置にのみmiseを利用しており依存ツールのインストール等は手動で行う必要があります。

### Pre-requirements

以下に示すツールは事前に導入していてください。

- Homebrew

### Installation

> [!IMPORTANT]
> GoおよびRustのツールチェーンは手動での導入としています。
> 公式サイトの指示に従ってインストールを行ってください。

```bash
# このリポジトリをcloneする
git clone https://github.com/aqyuki/dotfiles ~/.dotfiles

# ~/.dotfilesに移動
cd ~/.dotfiles

# Homebrewで管理しているツール類をインストールする
brew dump

# 設定ファイルの配置
mise trust
mise bootstrap dotfiles apply
```

## Tips

### Brewfileの更新

以下のmise taskを実行することでBrewfileを最新化できます。

```bash
mise run dump
```

## Refs

- [mise](https://mise.jdx.dev/)
