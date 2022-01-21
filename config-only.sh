echo "\n--------------------\nCopy config\n--------------------"

cp -sfv $(pwd -P)/configs/.zshrc ~
cp -sfv $(pwd -P)/configs/.vimrc ~
cp -sfv $(pwd -P)/configs/.p10k.zsh ~

echo "copy config done"
