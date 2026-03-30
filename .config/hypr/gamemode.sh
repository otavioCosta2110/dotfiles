#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword animation borderangle,0; \
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    # Hide waybar
    killall -SIGUSR1 waybar
    hyprctl notify 1 5000 "rgb(40a02b)" "Gamemode [ON]"
    exit
else
    # Show waybar
    killall -SIGUSR2 waybar
    hyprctl notify 1 5000 "rgb(d20f39)" "Gamemode [OFF]"
    # Reload config to restore defaults
    hyprctl reload
    exit 0
fi
exit 1
