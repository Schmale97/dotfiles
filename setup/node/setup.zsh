#!/usr/bin/env zsh

if exists nvm ; then
  echo "nvm exists, skipping install"
else
  PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash'
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
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