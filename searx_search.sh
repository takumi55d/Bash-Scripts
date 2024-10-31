#!/bin/bash

# Ensure carbonyl is installed
command -v carbonyl >/dev/null 2>&1 || { echo >&2 "carbonyl is required but it's not installed. Aborting."; exit 1; }

# Function to construct a Searx search URL and open it in carbonyl
search_with_carbonyl() {
    local query="$1"
    
    # Construct the Searx search URL
    local encoded_query=$(echo "$query" | sed 's/ /+/g')
    local searx_url="https://searx.daetalytica.io/search?q=$encoded_query"
    
    carbonyl "$searx_url"
}

# Check if the search query is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <search query>"
    exit 1
fi

# Run the search with carbonyl function with the provided query
search_with_carbonyl "$@"
