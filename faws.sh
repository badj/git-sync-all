#!/bin/bash

# Define the parent directory containing all your repos
PARENT_DIR="."

echo "Starting bulk update with auto-stash..."

for d in "$PARENT_DIR"/*/; do
    if [ -d "$d/.git" ]; then
        echo "--------------------------------------------"
        echo "Updating: ${d%/}"
        cd "$d"

        # 1. Fetch all remote changes
        git fetch --all

        # 2. Stash any local changes
        # We capture the output to check if anything was actually stashed
        STASH_RESULT=$(git stash 2>/dev/null)
        HAS_STASHED=$([[ $STASH_RESULT != "No local changes to save" ]] && echo true || echo false)

        if [ "$HAS_STASHED" = true ]; then
            echo "Local changes detected: Stashed."
        fi

        # 3. Pull the latest changes
        git pull

        # 4. Re-apply local changes if they were stashed
        if [ "$HAS_STASHED" = true ]; then
            echo "Re-applying local changes..."
            git stash pop
        fi

        cd ..
    fi
done

echo "--------------------------------------------"
echo "All done!"
