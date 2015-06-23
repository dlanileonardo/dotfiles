# Install vimrc
rm ~/.vimrc 2> /dev/null
ln -s $(pwd)/vimfiles/vimrc ~/.vimrc
echo "Link to .vimrc created!"
