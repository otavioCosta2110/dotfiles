#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$( (
    find ~/httpTests ~/dev -mindepth 1 -maxdepth 1 -type d;
    echo -e ~/.config/nvim/;
    echo -e ~/.config/i3/;
    echo -e ~/.config/alacritty/;
    echo -e ~/.config/hypr/;
    ) | fzf )
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi
export TERM=screen-256color

if ! tmux has-session -t="$selected_name" 2> /dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

client_count=$(tmux list-clients -t="$selected_name" | wc -l)


if [[ $client_count -eq 0 ]]; then
    tmux -2 attach-session -t "$selected_name" || tmux new-window -t "$selected_name"
else
    tmux -2 switch-client -t "$selected_name"
fi

