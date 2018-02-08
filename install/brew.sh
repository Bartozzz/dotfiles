#!/bin/bash
# Source: https://github.com/nicksp/dotfiles/blob/master/install/brew.sh

#
# NOTE  Installs Homebrew and some of the common dependencies needed/desired for
#       software development
#

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  printf "\e[0;32m  [✔] Installed the latest version of Homebrew\e[0m\n"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install the Homebrew packages I use on a day-to-day basis.
#
# - Languages: nvm (Node.js)
# - Fuck (https://github.com/nvbn/thefuck): Correct your previous command
# - Tree (http://mama.indstate.edu/users/ice/tree/): A directory listing utility
#
# Note that I install nvm (https://github.com/creationix/nvm) instead of
# installing Node directly. This gives me more explicit control over which
# version I'm using.

apps=(
  nvm
  git
  git-extras
  hub
  mtr
  tree
  wget
  wifi-password
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
