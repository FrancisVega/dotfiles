#!/usr/bin/env sh
tmux new-session -d 'vim'
tmux new-window 'vim'
tmux new-window 'terminal'
tmux attach-session -d
