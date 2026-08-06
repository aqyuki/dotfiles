function devup -d "開発ツールのアップデートを実行"
  # update tools managed by homebrew
  brew update
  brew upgrade --no-ask

  # update tools managed by mise
  mise up --yes

  # update Rust toolchain
  rustup update
end
