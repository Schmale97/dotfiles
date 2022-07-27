#!/usr/bin/env zsh

ANTIDOTE_DIR=$DOTFILES/antidote
git -C "${ANTIDOTE_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${ANTIDOTE_DIR}"

. $ANTIDOTE_DIR/antidote.zsh

antidote bundle < $DOTFILES/zsh_plugins.txt > $DOTFILES/zsh_plugins.zsh