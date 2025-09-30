function cleanup --on-signal HUP
    tmux kill-session -t temp_$fish_pid 2>/dev/null
end
tmux new -A -s temp_$fish_pid
