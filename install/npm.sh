#!/bin/bash
# Source: https://github.com/nicksp/dotfiles/blob/master/install/npm.sh

#
# NOTE  This script configures my Node.js development setup. Note that nvm is
#       installed by the Homebrew install script.
#

if test ! $(which nvm)
then
  # Install the latest stable version of node
  nvm install stable

  # Switch to the installed version
  nvm use node

  # Use the stable version of node by default
  nvm alias default node

  printf "\e[0;32m  [✔] Installed a stable version of Node\e[0m\n"
fi

# All `npm install <pkg>` commands will pin to the version that was available at
# the time you run the command
npm config set save-exact = true

# Globally install with npm. To list globally installed npm packages and version
# use `npm list -g --depth=0`
packages=(
  flow-bin
  flow-typed
  webpack
  nodemon
  tldr
  vtop
  http-server
  servedir
)

npm install -g "${packages[@]}"
