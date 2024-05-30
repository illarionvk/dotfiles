#!/bin/bash

set -euo pipefail

# Link config files to home folder
ls -1 -d ~/dotfiles/* | grep -v 'nvim' | grep -v 'vscode' | sort -V | parallel -j 1 'ln -sfv {} ~/.{/}'

# Link nvim config folder to home folder
ls -1 -d ~/dotfiles/* | grep 'nvim' | sort -V | parallel -j 1 'ln -sfv {} ~/.config/{/}'

# Link VSCode configuration
ln -sfv ~/dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sfv ~/dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sfv ~/dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User
