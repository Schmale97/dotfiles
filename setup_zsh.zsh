#!/usr/bin/env zsh

ZSH_PATH="$HOMEBREW_PREFIX/bin/zsh"
# https://stackoverflow.com/a/4749368/1341838
if grep -Fxq "$ZSH_PATH" '/etc/shells'; then
  echo "$ZSH_PATH already exists in /etc/shells"
else
  echo "Enter superuser (sudo) password to edit /etc/shells"
  echo "$ZSH_PATH" | sudo tee -a '/etc/shells' >/dev/null
fi

if [ "$SHELL" = "$ZSH_PATH" ]; then
  echo '$SHELL'" is already ${ZSH_PATH}"
else
  echo "Enter user password to change login shell"
  chsh -s "$ZSH_PATH" $USER
fi