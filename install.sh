#!/bin/bash

cd "$(dirname "$0")"

if [ ! -f .vimrc ]; then
  echo "I suspected a .vimrc :( \nI'm here: ${pwd}"
fi

if [ -f ~/.vimrc ]; then
  if [ $( grep -c 'https://git.nex.zone/lroehrs/vimrc' ~/.vimrc ) -ge "1" ]; then
    echo "Found already a .vimrc from my own repo!"
    cp -i .vimrc ~/.vimrc
  else
    echo"~/.vimrc already exist!"
    cp -i .vimrc ~/.vimrc
  fi
else
  cat .vimrc > ~/.vimrc
fi

if [ -d ~/.vim/ ]; then
  echo "~/.vim/ already exist!"
  read -p "Overwrite? (Y/n)" answer

  case "$answer" in
    Yes|yes|Y|y|"") rm -rf ~/.vim/ 
      cp -rf .vim/ ~/.vim/ ;;
    No|no|N|n|*) echo "Skipped!" ;;
  esac

else
  cp -rf .vim/ ~/.vim/
fi

