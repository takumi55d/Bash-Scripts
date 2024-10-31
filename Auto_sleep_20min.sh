#!/bin/bash

# Function to display a notification
notify_sleep() {
  local message="$1"
  notify-send -i "sleep" -t 5000 "$message"
}

while true; do
  # Sleep for 20 minutes (minus 5 seconds for notification)
  sleep 1180

  # Display notification with 5-second timeout for user input
  notify_sleep "Your PC will go to sleep in 5 seconds. Press 'n' to cancel."

  # Read user input (timeout after 5 seconds)
  read -r -t 5 answer

  # Check user input (lowercase for case-insensitive)
  if [[ "$answer" == "n" || "$answer" == "N" ]]; then
    # User wants to cancel sleep, continue looping
    continue
  fi

  # User didn't respond or pressed anything else, go to sleep
  systemctl suspend
done
