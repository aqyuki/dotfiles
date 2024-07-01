#!/bin/bash

tmux split-window -h
tmux split-window -v
tmux resize-pane -R 40
tmux select-pane -t 0

