# Personal aliases

alias ne='PATH=$(npm bin):$PATH'

alias path="echo $PATH | tr -s ':' '\n'"

# Chande current directory in all Tmux panes
switchAllPanesToFolderInTmux()
{
  cd $1
  paneIndexes=("${(@f)$(tmux list-panes -F "#{pane_index}")}")
  for i in $paneIndexes
  do
    tmux send-keys -t "$i" "cd \"$(pwd)\" && clear" Enter
  done
  tmux select-pane -t "${paneIndexes[1]}"
}
alias cdpanes=switchAllPanesToFolderInTmux

# Convert images to JPEG with ImageMagick
tojpeg()
{
  parallel --will-cite -j 1 --halt 2 'convert {} -strip -background white -interlace Plane -quality "95%" -mosaic -alpha remove {.}.jpg' ::: $@
}

alias toJPEG=tojpeg

# Clean tree output
alias tree="tree -I 'node_modules|bower_components|Gemfile*' -F --dirsfirst"

# Run Midnight Commander without subshell to fix slow start times
alias mc="mc --nosubshell"

# Activate fzf fuzzy matching
export FZF_DEFAULT_COMMAND="rg --files --smart-case --glob '!*Library*' --iglob '!*flow-typed*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--reverse'

_fzf_compgen_path() {
  rg --files --smart-case --glob '!*Library*' "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable smart case in ripgrep by default
alias rg="rg --smart-case"

# List Docker image tags
function list-docker-tags() {
  wget -q "https://registry.hub.docker.com/v2/repositories/library/${1}/tags?page_size=1024" -O - | jq -r '.results[].name'
}

# Docker cleaning
alias docker.cleancontainer="docker ps -a -q | xargs docker rm"
alias docker.cleanimage="docker images --filter dangling=true -q | xargs docker rmi"

# Compress PDF file with GhostScript
function compress-pdf() {
  gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -dCompatibilityLevel=1.4 -sOutputFile=$2 $1
}

function datagrip() {
  open -na "DataGrip" ./
}

function sha512-check-all() {
  shasum -a 512 -c $1
}

function dn() {
  mc ${1:-.} $(~/core/fs/fuzzy-folder.sh)
}
