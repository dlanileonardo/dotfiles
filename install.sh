#!/bin/bash

# Install vimrc
rm ~/.vimrc 2> /dev/null
ln -s $(pwd)/vimfiles/vimrc ~/.vimrc
echo "Link to .vimrc created!"

rm ~/.zshrc 2> /dev/null
ln -s $(pwd)/.zshrc ~/.zshrc
echo "Link to .zshrc created!"

rm ~/.bashrc 2> /dev/null
ln -s $(pwd)/.bashrc ~/.bashrc
echo "Link to .bashrc created!"

rm ~/.bash_profile 2> /dev/null
ln -s $(pwd)/.bash_profile ~/.bash_profile
echo "Link to .bash_profile created!"

echo "Criando arquivos do base16 ..."
sh -c "cd base16-builder; ./base16 1> /dev/null; cd output; bash guake/base16-default.dark.sh; bash gnome-terminal/base16-default.dark.sh"
echo "Cores base16 definidas no seu terminal!"