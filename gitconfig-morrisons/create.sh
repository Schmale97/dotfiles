#!/bin/bash

[ ! -f ~/.gitconfig ] && (touch ~/.gitconfig-morrisons && cat template > ~/.gitconfig-morrisons) || echo '.gitconfig-morrisons already exists'