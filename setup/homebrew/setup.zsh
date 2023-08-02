#!/usr/bin/env zsh

if exists brew ; then
    echo "brew exists, skipping install"
else
    echo "brew doesn't exist, continuing with install"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
fi

brew bundle --verbose --cleanup
brew cleanup --verbose