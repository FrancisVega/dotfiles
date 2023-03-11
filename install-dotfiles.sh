#!/usr/bin/env sh

# This script download my dotfiles and install (copy) them if they don't exists
# in the system.
#
# Use:
# curl https://raw.githubusercontent.com/FrancisVega/dotfiles/master/install.sh | bash

files=(vimrc zshrc tmux.conf)
github_url=https://raw.githubusercontent.com/FrancisVega/dotfiles/master

download_dotfile () {
    if [ -f $2 ]; then
        echo $2 exists. Remove it first.
    else 
        echo "install $2"
        curl $1 --output $2
    fi
}

for dotfile in ${files[@]}
do
    download_dotfile "$github_url/$dotfile.symlink" ~/.$dotfile
done
