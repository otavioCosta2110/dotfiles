#!/bin/bash

layout=$(setxkbmap -query | awk '/layout/ {print $2}')

echo $layout
if [[ $layout == "us" ]]; then
    setxkbmap -layout br
else
    setxkbmap -layout us
fi

