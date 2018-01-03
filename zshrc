# Path to your oh-my-zsh installation.
export ZSH=/Users/hex/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"
BULLETTRAIN_GIT_EXTENDED=false
BULLETTRAIN_NVM_SHOW=false
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_RUBY_SHOW=false
BULLETTRAIN_VIRTUALENV_SHOW=false

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

DEFAULT_USER=hex

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bundleexec()
{
  bundle exec $@
}
alias be=bundleexec

npmrun()
{
  npm run $@
}
alias nr=npmrun

alias ne='PATH=$(npm bin):$PATH'

alias path="echo $PATH | tr -s ':' '\n'"

# Chande current directory in all Tmux panes
switchAllPanesToFolderInTmux()
{
  cd $1
  paneIndexes=("${(@f)$(tmux list-panes -F "#{pane_index}")}")
  for i in $paneIndexes
  do
    tmux send-keys -t "$i" "cd $(pwd)" Enter
  done
  tmux select-pane -t "${paneIndexes[1]}"
}
alias cdpanes=switchAllPanesToFolderInTmux

# Control iTunes and Spotify
alias nTune="osascript -e 'tell application \"iTunes\" to next track'"
alias nSpot="osascript -e 'tell application \"Spotify\" to next track'"

# ImageMagick
tojpeg()
{
convert $1 -strip -background white -interlace Plane -quality "95%" -mosaic -alpha remove ${1%.*}.jpg
}

alias toJPEG=tojpeg

# Tree
alias cleantree="tree -I 'node_modules|bower_components|Gemfile*' -F --dirsfirst"

# This loads nvm
export NVM_DIR="/Users/hex/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Check node version on working dir change
function nvm_chpwd() {
  if [ -r $PWD/.nvmrc ]; then
    nvm use `cat $PWD/.nvmrc`
  fi
}
chpwd_functions=(${chpwd_functions[@]} "nvm_chpwd")

# Activate fzf fuzzy matching
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--reverse'

_fzf_compgen_path() {
  rg --files "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias rg="rg -i"
