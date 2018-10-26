#!/usr/bin/env bash

# TILE INFO IS SIMPLE STRING OF THE FOLLOWING:  TILENAME TILEURL
tileinfo=$(./list-remote-tiles.sh | grep $1 | head -n 1)

tilename=$(echo "$tileinfo" | awk '{ print $1 }')
tileurl=$(echo "$tileinfo" | awk '{ print $2 }')

# SAVE THE ARCHIVE AS A TEMPORARY FILE
temp_output_archive="../../../local-data/tmp/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"
output_directory="../../../local-data/tiles/$tilename"

# DOWNLOAD THE FILE TO A TEMP DIRECTORY
curl -o "./$temp_output_archive" -f "$tileurl"

# UNZIP THE ARCHIVE AND DELETE IT 
mkdir "$output_directory" && tar -C "$output_directory" -xvf "$temp_output_archive" && rm "$temp_output_archive"
