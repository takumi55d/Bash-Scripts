#!/bin/bash

# Define the mount point and device
SR_MOUNT_POINT="/run/media/sr/SR"
DEVICE="/dev/nvme0n1p5"

# Check if the directory exists using a more robust method
if [[ ! -d "$SR_MOUNT_POINT" ]]; then
  # Create the directory with appropriate permissions (optional)
  sudo mkdir -p "$SR_MOUNT_POINT"
  # Set ownership and permissions (adjust as needed)
  sudo chown "$USER:$USER" "$SR_MOUNT_POINT"
  sudo chmod 755 "$SR_MOUNT_POINT"
fi

# Attempt to mount the device with informative output
if sudo mount -o defaults,discard "$DEVICE" "$SR_MOUNT_POINT"; then
  echo "Successfully mounted $DEVICE to $SR_MOUNT_POINT"
else
  echo "Failed to mount $DEVICE to $SR_MOUNT_POINT. Please check for errors (e.g., using 'dmesg')"
fi
