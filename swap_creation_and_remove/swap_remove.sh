#!/bin/bash

# Define swap file location (assuming it's the same as before)
SWAP_FILE="/swapfile"

# Deactivate the swap file (if it's still active)
sudo swapoff "$SWAP_FILE" || {
  echo "Swap file already deactivated or doesn't exist."
}

# Remove the swap file entry from fstab
sudo sed -i "/$SWAP_FILE/d" /etc/fstab

# Delete the swap file
sudo rm -f "$SWAP_FILE"

echo "Swap file disabled and removed successfully!"
