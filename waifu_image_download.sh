#!/bin/bash

# Define the API URL
API_URL="https://api.waifu.pics/sfw/waifu"

# Fetch the JSON response from the API
response=$(curl -s "$API_URL")

# Extract the image URL using jq
image_url=$(echo "$response" | jq -r '.url')

# Check if the image URL was extracted successfully
if [[ -z "$image_url" ]]; then
  echo "Failed to retrieve image URL."
  exit 1
fi

# Display the image using feh
curl -O "$image_url"
