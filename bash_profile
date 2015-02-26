export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim

# Prompt Format
PS1='\[\e[0;33m\]\A \W \u\$\[\e[m\] '

PATH=/usr/local/bin:$PATH # Check Brew before system bins

PATH=/usr/texbin:$PATH # Add TeX to PATH

source ~/.tmuxinator/tmuxinator.bash
PATH=$PATH:$HOME/Library/Python/2.7/bin # Add Powerline to PATH

#source /Users/hex/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

eval "$(rbenv init -)"

# Include bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
