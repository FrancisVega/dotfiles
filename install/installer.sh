#!/usr/bin/env zsh

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

# Install ssh key
./gitconfig.sh
