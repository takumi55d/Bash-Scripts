#!/bin/bash

# Ensure carbonyl is installed
command -v carbonyl >/dev/null 2>&1 || { echo >&2 "carbonyl is required but it's not installed. Aborting."; exit 1; }

# Function to construct a Brave Search URL with dark mode enabled and open it in carbonyl
search_with_carbonyl() {
    local query="$1"
    
    # Construct the Brave Search URL with dark mode enabled
    local encoded_query=$(echo "$query" | sed 's/ /+/g')
    local brave_search_url="https://search.brave.com/search?q=$encoded_query&prefers-color-scheme=dark"
    
    # Open the URL in carbonyl
    carbonyl "$brave_search_url"
}

# Check if the search query is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <search query>"
    exit 1
fi

# Run the search with carbonyl function with the provided query
search_with_carbonyl "$@"
