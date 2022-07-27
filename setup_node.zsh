#!/usr/bin/env zsh

if [ $(nvm current) = "none" ]; then
  nvm install --lts
  nvm use default
else
  echo "Current node verison $(nvm current)"
fi

# # Install Global NPM Packages
npm install --location=global firebase-tools
npm install --location=global trash-cli

echo "Global NPM Packages Installed:"
npm list --location=global --depth=0