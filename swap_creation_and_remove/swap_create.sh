#!/bin/bash

# Define swap file location
SWAP_FILE="/swapfile"

# Create 4GB swap file
sudo fallocate -l 4G "$SWAP_FILE" || {
  echo "Failed to create swap file!"
  exit 1
}

# Set swap file permissions
sudo chmod 600 "$SWAP_FILE"

# Initialize swap on the file
sudo mkswap "$SWAP_FILE"

# Activate the swap
sudo swapon "$SWAP_FILE"

# Backup fstab (optional but recommended)
sudo cp /etc/fstab /etc/fstab.bak

# Add swap entry to fstab
echo "$SWAP_FILE none swap sw 0 0" | sudo tee -a /etc/fstab

# Verify fstab syntax (recommended)
sudo swapoff "$SWAP_FILE" && sudo swapon -a  # Checks fstab for errors

echo "Swap file created and enabled successfully!"
