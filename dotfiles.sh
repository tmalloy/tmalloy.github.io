#!/usr/bin/env bash

# Run this command:
# curl -sL taylormalloy.com/dotfiles.sh | bash

set -e

# Install homebrew
if [[ -z `which brew` ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Skipping homebrew install"
fi

brew install \
  babashka \
  git \
  neovim \
  tmux \
  ripgrep

git clone https://github.com/tmalloy/dotfiles.git ~/.dotfiles

cd ~/.dotfiles

git submodule update --init --recursive

bb main link


