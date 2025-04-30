#!/bin/bash

IMG_DIR="./img"
COUNT=1

# Loop over files not already starting with 'pic'
find "$IMG_DIR" -maxdepth 1 -type f ! -iname "pic*" \( -iname "*.jpeg" -o -iname "*.jpg" \) | sort | while IFS= read -r FILE; do
  # Create new filename with normalized .jpg extension
  NEW_NAME="$IMG_DIR/pic${COUNT}.jpg"

  # If the new filename already exists, find the next available number
  while [ -e "$NEW_NAME" ]; do
    COUNT=$((COUNT + 1))
    NEW_NAME="$IMG_DIR/pic${COUNT}.jpg"
  done

  # Rename the file
  mv "$FILE" "$NEW_NAME"
  echo "Renamed: $FILE → $NEW_NAME"

  COUNT=$((COUNT + 1))
done
