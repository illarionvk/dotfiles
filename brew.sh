#!/bin/bash

set -Eeuo pipefail

brew install --formulae \
  aria2 \
  fd \
  fzf \
  git \
  jq \
  midnight-commander \
  ncdu \
  neovim \
  pandoc \
  parallel \
  pv \
  ripgrep \
  rsync \
  tmux \
  tree \
  vim \
  wget

brew tap homebrew-ffmpeg/ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac
