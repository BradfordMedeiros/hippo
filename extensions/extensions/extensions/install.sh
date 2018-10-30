#!/usr/bin/env bash

extension_info=$(./list-remote-extensions.sh | grep $1 | head -n 1)
extension_name=$(echo "$extension_info" | awk '{ print $1 }')
extension_url=$(echo "$extension_info" | awk '{ print $2 }')

output_directory="../$extension_name"
temp_output_archive="../../local_data/tmp/$(cat /dev/urandom 2>/dev/null | tr -cd 'a-f0-9' 2>/dev/null | head -c 32 2>/dev/null)"

if [ -z "$extension_name"  ] 
then
	echo "invalid"
	exit 1
fi


if [ -d "$output_directory" ]   # for file "if [-f /home/rama/file]" 
then 
    echo "extension already installed"
   	exit 1
fi


# download tar to temp directory 
curl -o "./$temp_output_archive" -f "$extension_url"

#unzip the tar and delete it
mkdir "$output_directory" && tar -C "$output_directory" -xvf "$temp_output_archive" && rm "$temp_output_archive"

