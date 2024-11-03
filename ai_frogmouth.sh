#!/bin/bash

# Check if any arguments are provided
if [ "$#" -eq 0 ]; then
  echo "Usage: aichat <your question>"
  exit 1
fi

# Capture all arguments as a single input string
input="$@"

# Execute the commands
aichat "$input" >aioutput.md
frogmouth aioutput.md

# Clean up the temporary file
rm aioutput.md
