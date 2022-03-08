#!/bin/bash

set -Eeuo pipefail

brew install aria2
brew install fd
brew install git
brew install jq
brew install mc
brew install neovim
brew install pandoc
brew install parallel
brew install pv
brew install ripgrep
brew install rsync
brew install the_silver_searcher
brew install tmux
brew install tree
brew install vim
brew install wget

brew tap homebrew-ffmpeg/ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac
