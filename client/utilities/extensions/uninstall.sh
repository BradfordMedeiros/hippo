#!/usr/bin/env bash
set -e
# this is unsafe since we don't escape input in any way
extension_name=$1

fullpath=$(realpath "../$extension_name")
extension_path=$(realpath ..)

echo "fullpath: $fullpath"
echo "ext_path: $extension_path"

extension_name=$(realpath "$fullpath" --relative-to="$extension_path")

echo "ext name: $extension_name" 
first_level=$(echo "$extension_name" | awk -F/ '{ print $1 }')
if [[ "$first_level" == ".." ]] ;then
	 echo "invalid extension name"
	 exit 1
fi

rm -r "../$extension_name"