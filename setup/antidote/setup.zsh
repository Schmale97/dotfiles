#!/usr/bin/env zsh

ANTIDOTE_DIR=$DOTFILES/antidote
git -C "${ANTIDOTE_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${ANTIDOTE_DIR}"

. $ANTIDOTE_DIR/antidote.zsh

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_AUTO_USE=true
antidote bundle < $(dirname $0)/zsh_plugins.txt > $DOTFILES/zsh_plugins.zsh