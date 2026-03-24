#!/bin/bash

if [ "$(pamixer --get-mute)" == "false" ]; then
  echo "true"
  pamixer -m
elif [ "$(pamixer --get-mute)" == "true" ]; then
  pamixer -u
fi

