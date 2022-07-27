# Set directory for dotfiles repo
export DOTFILES="$HOME/.dotfiles"
export NPM_PATH=$(which npm)

eval "$(/opt/homebrew/bin/brew shellenv)"

source "$(brew --prefix nvm)/nvm.sh"

function exists () {
  command -v $1 >/dev/null 2>&1
}