#!/bin/bash

# Define the parent directory containing all your repos
# Use "." for current directory or provide a full path
PARENT_DIR="."

echo "Starting bulk fetch and pull..."

for d in "$PARENT_DIR"/*/; do
    if [ -d "$d/.git" ]; then
        echo "--------------------------------------------"
        echo "Updating: ${d%/}"
        cd "$d"

        # Fetch updates from remote
        git fetch --all

        # Pull changes (adjusting for current branch)
        git pull

        cd ..
    fi
done

echo "--------------------------------------------"
echo "Done!"
