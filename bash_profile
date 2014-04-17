
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim

# Prompt Format
PS1='\[\e[0;33m\]\h(\A):\w \u\$\[\e[m\] '

alias vim="/usr/local/bin/vim"
alias ll="ls -lGp"

bundleexec()
{
  bundle exec $1 $2 $3 $4
}
alias b=bundleexec

source ~/.tmuxinator/tmuxinator.bash
PATH=$PATH:$HOME/Library/Python/2.7/bin # Add Powerline to PATH

#source /Users/hex/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

# Convenience aliases are stored in bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
