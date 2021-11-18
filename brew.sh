#!/bin/bash

set -Eeuo pipefail

brew install git
brew install jq
brew install mc
brew install neovim
brew install parallel
brew install pv
brew install ripgrep
brew install rsync
brew install the_silver_searcher
brew install tmux
brew install vim

brew tap homebrew-ffmpeg/ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac
