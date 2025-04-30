#!/bin/bash

# Directory containing your images
IMG_DIR="./img"

# Declare an array of the original filenames
original_files=(
  "pic1.jpg" "pic2.jpg" "pic4.jpg" "pic5.jpg" "pic6.jpg" "pic7.jpg"
  "pic8.jpg" "pic9.jpg" "pic10.jpg" "pic11.jpg" "pic12.jpg" "pic13.jpg"
  "pic14.jpg" "pic15.jpg" "pic16.jpg" "pic17.jpg" "pic18.jpg" "pic19.jpg"
  "pic20.jpg" "pic21.jpg" "pic23.jpg" "pic26.jpg" "pic27.jpg" "pic28.jpg"
  "pic29.jpg"
)

# Loop through and rename files
counter=1
for file in "${original_files[@]}"; do
  ext="${file##*.}"
  new_name=$(printf "photo%02d.%s" "$counter" "$ext")
  mv "$IMG_DIR/$file" "$IMG_DIR/$new_name"
  echo "Renamed $file -> $new_name"
  ((counter++))
done
