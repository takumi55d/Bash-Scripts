#!/bin/bash
# A while loop
while true; do
  # Calculate time . i'll go 20 mins
  sleep 1200
  # Send notification
  notify-send "Oy it's been 20 mins go take a walk or something MR. archuser"
done &
