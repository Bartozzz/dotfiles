#!/usr/bin/env bash

if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  # Install Oh My Zsh if it isn't already present
  if [[ ! -d $dir/oh-my-zsh/ ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi
fi

# Install my preffered zsh theme:
mkdir $ZSH/themes
wget -O $ZSH/themes/hyperzsh.zsh-theme https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme

# Reload zsh settings:
source ~/.zshrc
