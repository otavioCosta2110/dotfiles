#!/bin/bash

# Get current day of week (1-7, where 1=Monday, 7=Sunday)
DAY_OF_WEEK=$(date +%u)

# Get current hour in 24-hour format
CURRENT_HOUR=$(date +%H)

if [ "$DAY_OF_WEEK" -ge 1 ] && [ "$DAY_OF_WEEK" -le 5 ]; then
    if [ "$CURRENT_HOUR" -ge 7 ] && [ "$CURRENT_HOUR" -lt 17 ]; then
        firefox &
        slack &
        exit 0
    else
        exit 1
    fi
else
    exit 2
fi
