#!/bin/bash

tmux new-session -s develop
tmux split-window -h
tmux split-window -v
tmux resize-pane -R 40
tmux select-pane -t 0

