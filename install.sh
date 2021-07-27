#!/bin/bash

cd "$(dirname "$0")"

if [[ ! -f .vimrc ]]; then
	echo "I suspected here a .vimrc! \nPWD: ${pwd}"
fi

if [[ -f ~/.vimrc ]]; then
	echo"~/.vimrc already exist!"
	read -p "Overwrite? (Y/n)" answer
	case "$answer" in
		[yY][eE][sS]|[yY]|"")
			cat .vimrc > ~/.vimrc
			;;
		[nN][oO]|[nN]|*)
			echo "Skipped!"
			;;
	esac
else
	cat .vimrc > ~/.vimrc
fi

if [[ -d ~/.vim/ ]]; then
	echo "~/.vim/ already exist!"
	read -p "Overwrite? (Y/n)" answer
	case "$answer" in
		[yY][eE][sS]|[yY]|"")
			rm -rf ~/.vim/
			cp -rf .vim/ ~/.vim/
			;;
		[nN][oO]|[nN]|*)
			echo "Skipped!"
			;;
	esac
else
	cp -rf .vim/ ~/.vim/
fi
