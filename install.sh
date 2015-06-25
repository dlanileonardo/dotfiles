#!/bin/bash

# Install vimrc
rm ~/.vimrc 2> /dev/null
ln -s $(pwd)/vimfiles/vimrc ~/.vimrc
echo "Link to .vimrc created!"

echo "Install Vundle in Vim"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Vundle Installed"

rm ~/.bashrc 2> /dev/null
ln -s $(pwd)/.bashrc ~/.bashrc
echo "Link to .bashrc created!"

rm ~/.secret_envs 2> /dev/null
ln -s $(pwd)/.secret_envs ~/.secret_envs
echo "Link to .secret_envs created!"

rm ~/.bash_profile 2> /dev/null
ln -s $(pwd)/.bash_profile ~/.bash_profile
echo "Link to .bash_profile created!"

rm ~/.powerlevel9krc 2> /dev/null
ln -s $(pwd)/.powerlevel9krc ~/.powerlevel9krc
echo "Link to .powerlevel9krc created!"

rm ~/.zshrc 2> /dev/null
ln -s $(pwd)/.zshrc ~/.zshrc
echo "Link to .zshrc created!"

echo "Base16 files will be created ..."
sh -c "cd base16-builder; ./base16 1> /dev/null; cd output; bash guake/base16-google.dark.sh; bash gnome-terminal/base16-google.dark.sh"
echo "Base16 has defined with sucess!"

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "The oh-my-zsh installed!"

echo "Install powerlevel9k theme"
sh -c "cd ~/.oh-my-zsh/custom; git clone https://github.com/bhilburn/powerlevel9k.git themes/powerlevel9k"
echo "The powerlevel9k Installed!"

echo "Install Awesome Fonts"
sh -c "cd awesome-terminal-fonts; ./droid.sh"
echo "Awsome Fonts Installed"