# Set directory for dotfiles repo
export DOTFILES="$HOME/.dotfiles"

#Setup Homebrew in shell
eval "$(/opt/homebrew/bin/brew shellenv)"

#Setup nvm in shell
. "$(brew --prefix nvm)/nvm.sh"

function exists () {
  command -v $1 >/dev/null 2>&1
}