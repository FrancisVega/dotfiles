#!/usr/bin/env sh

FILE=~/.vimrc
if [ -f "$FILE" ]; then
    echo "$FILE exists. Remove it first"
else 
    echo "download .vimrc"
    curl https://raw.githubusercontent.com/FrancisVega/dotfiles/master/vimrc.symlink --output ~/.vimrc
fi
