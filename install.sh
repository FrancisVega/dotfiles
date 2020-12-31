#!/usr/bin/env sh
#curl https://raw.githubusercontent.com/FrancisVega/dotfiles/master/vimrc.symlink --output ~/.vimrc

FILE=~/.vimrc
if [ -f "$FILE" ]; then
    echo "$FILE exists. Remove it first"
else 
    echo "download .vimrc"
fi
