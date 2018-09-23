#!/bin/bash
# Source: https://github.com/nicksp/dotfiles/blob/master/install/brew.sh

#
# NOTE  Installs Homebrew and some of the common dependencies needed/desired for
#       software development
#

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

  printf "\e[0;32m  [✔] Installed the latest version of Homebrew\e[0m\n"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade
brew upgrade gawk

brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# Install some CTF tools:
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp
brew install xpdf
brew install xz

# Install the Homebrew packages I use on a day-to-day basis:
apps=(
  zsh
  antigen         # (https://github.com/zsh-users/antigen): plugin manager for zsh
  exa             # (https://github.com/ogham/exa): Replacement for ls
  nvm
  git
  git-extras
  thefuck         # (https://github.com/nvbn/thefuck): Correct your previous command
  tree            # (http://mama.indstate.edu/users/ice/tree/): A directory listing utility
  wget            # (https://www.gnu.org/software/wget/): Internet file retriever
  screenfetch     # (https://github.com/KittyKatt/screenFetch): Show system info
  wifi-password   # (https://github.com/rauchg/wifi-password): Show network password
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
