#!/bin/bash

git config --global core.autocrlf false
git config --global core.eol lf

if [[ "$1" == "--help" ]];
then
  echo "Available Operating Systems: ubuntu (default)"
  exit
fi

DISTRIBUTION=${1:-"ubuntu"}

# dependencies
case $DISTRIBUTION in
  ubuntu)
    sudo apt-get update
    sudo apt-get install -y curl stow zsh neovim dunst rofi awesome ruby-full
  ;;
esac


# Cleanup
sudo rm -rf $HOME/.oh-my-zsh

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Theme -> PowerLevel10K
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k

# Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
sudo gem install colorls

# Default shell zsh
chsh $USER -s /bin/zsh

# symlink all dotfiles
rm ~/.zshrc
stow */

echo "installation done"
