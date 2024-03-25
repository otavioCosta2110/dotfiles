#!/bin/bash

# Get the LED status
STATUS=$(xset -q | grep "LED" | awk '{print $10}')

# Toggle the Scroll Lock LED
if [ "${STATUS}" = "00000006" ]; then
  xset -led 3
else
  xset led 3
fi

exit 0

