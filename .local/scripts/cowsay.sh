#!/bin/bash

path=/home/otavio/.local/scripts/legal.txt
cow=$(cat $path | cowsay )
printf "%s\n" "$cow"
echo $cow >> $path
