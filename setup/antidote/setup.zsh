#!/usr/bin/env zsh

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote bundle < $(dirname $0)/zsh_plugins.txt > $DOTFILES/zsh_plugins.zsh