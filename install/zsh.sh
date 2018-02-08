#!/usr/bin/env bash

# NOTE  Install Zsh
#       https://github.com/robbyrussell/oh-my-zsh
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  # Install Oh My Zsh if it isn't already present
  if [[ ! -d $dir/oh-my-zsh/ ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi
else
  # If zsh isn't installed, get the platform of the current machine
  platform=$(uname);

  # If the platform is Linux, try an apt-get to install zsh and then recurse
  if [[ $platform == 'Linux' ]]; then
    if [[ -f /etc/redhat-release ]]; then
      sudo yum install zsh
      install_zsh
    fi

    if [[ -f /etc/debian_version ]]; then
      sudo apt-get install zsh
      install_zsh
    fi
  elif [[ $platform == 'Darwin' ]]; then
    print_info "We'll install zsh, then re-run this script!"
    brew install zsh
    exit
  fi
fi

# NOTE  Install Zsh theme
#       https://github.com/tylerreckart/hyperzsh
mkdir $ZSH/themes
wget -O $ZSH/themes/hyperzsh.zsh-theme https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme

# NOTE  Reload zsh settings
source ~/.zshrc
