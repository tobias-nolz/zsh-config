git config --global core.autocrlf false
git config --global core.eol lf

git fetch origin
git reset --hard origin/master

#Oh my Zsh
rm -rf /home/main/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#PowerLevel10K
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

#Zsh Syntax Highlighting
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#Zsh suggestions
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo apt update && sudo apt install ruby-full
sudo gem install colorls

cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
cp .p10k.zsh ~/.p10k.zsh
