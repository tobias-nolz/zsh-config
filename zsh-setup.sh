git config --global core.autocrlf false
git config --global core.eol lf

#Install ZSH
echo -e "\n--------------------\nzsh installation\n--------------------"
sudo apt update && sudo apt install curl vim zsh ruby-full
echo "zsh installation done"

#Cleanup
echo -e "\n--------------------\nCleanup\n--------------------"
sudo rm -rf $HOME/.oh-my-zsh
echo "cleanup done"

echo -e "\n--------------------\nOh My ZSH\n--------------------"
#Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "oh my zsh done"

echo -e "\n--------------------\nPlugins\n--------------------"
#PowerLevel10K
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k

#Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting

#Zsh suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions

sudo gem install colorls
echo "plugins done"

echo -e "\n--------------------\nCopy config\n--------------------"
cp -v configs/.zshrc ~/.zshrc
cp -v configs/.vimrc ~/.vimrc
cp -v configs/.p10k.zsh ~/.p10k.zsh
echo "copy config done"
