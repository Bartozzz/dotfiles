#!/bin/bash
# Source: https://github.com/nicksp/dotfiles/blob/master/install/brew-cask.sh

# Install Caskroom
brew tap caskroom/cask
brew tap caskroom/versions

# Install packages
apps=(
  imagealpha
  imageoptim
  # dash
  # atom
  vscodium
  iterm2
  # commander-one
  firefox
  firefox-nightly
  google-chrome
  google-chrome-canary
  # spotify
  skype
  slack
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize qlprettypatch
