#!/bin/bash
# Source: https://github.com/nicksp/dotfiles/blob/master/install/brew-cask.sh

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages
apps=(
  dash
  iterm2
  atom
  google-chrome
  google-chrome-canary
  spotify
  commander-one
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize qlprettypatch
