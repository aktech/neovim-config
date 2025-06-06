# Neovim configuration

## Requirements

```bash
brew install chafa lua viu lazygit pngpaste fzf colorscript font-fira-code
    bash-language-server shellcheck
brew install --cask kitty

npm -g install @microsoft/compose-language-service
go install github.com/docker/docker-language-server/cmd/docker-language-server@latest
```

## Installation

Clone this repository and run nvim

```
git clone git@github.com:aktech/neovim-config.git ~/.config/nvim/
```

## Notes

If rust-analyzer doesn't work:

```
rustup component add rust-analyzer
```
