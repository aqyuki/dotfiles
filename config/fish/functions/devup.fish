function devup -d "開発ツールのアップデートを実行"
  # update tools managed by homebrew
  brew update
  brew upgrade

  # update tools managed by mise
  mise up

  # update Rust toolchain
  rustup update
end
