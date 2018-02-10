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

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install some CTF tools; see https://github.com/ctfs/write-ups.
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

# Install the Homebrew packages I use on a day-to-day basis.
#
# - Languages: nvm (Node.js)
# - Exa (https://github.com/ogham/exa): Replacement for ls
# - Fuck (https://github.com/nvbn/thefuck): Correct your previous command
# - Tree (http://mama.indstate.edu/users/ice/tree/): A directory listing utility
# - wget (http://mama.indstate.edu/users/ice/tree/): Internet file retriever
# - screenfetch (https://github.com/KittyKatt/screenFetch): Show system info
# - wifi-password (https://github.com/rauchg/wifi-password): Show network password
apps=(
  zsh
  exa
  nvm
  git
  git-extras
  thefuck
  tree
  wget
  screenfetch
  wifi-password
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup
