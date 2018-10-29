#!/usr/bin/env bash
set -e

extension_name=$1

fullpath=$(realpath "../$extension_name")
extension_path=$(realpath ..)
extension_name=$(realpath "$fullpath" --relative-to="$extension_path")

first_level=$(echo "$extension_name" | awk -F/ '{ print $1 }')
if [[ "$first_level" == ".." ]] ;then
	 echo "invalid extension name"
	 exit 1
fi

rm -r "../$extension_name"