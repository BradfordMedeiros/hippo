#!/usr/bin/env bash
set -e

extension_name=$1

fullpath=$(realpath "../$extension_name")
extension_path=$(realpath ..)
extension_name=$(realpath "$fullpath" --relative-to="$extension_path")
first_level=$(echo "$extension_name" | awk -F/ '{ print $1 }')

if [[ $(id -u) != 0 ]]; then
	echo "Uninstall must be run as root"
	exit 1
fi

if [[ "$first_level" == ".." ]] ;then
	 echo "invalid extension name"
	 exit 1
fi

python dependent-packages.py "$extension_name" > /dev/null || (echo "cannot uninstall -> dependencies" && exit 1)

ON_UNINSTALL_SCRIPT=$(cat "../$extension_name/command-surface.json" | jq -r '.on_uninstall')
UNINSTALL_FULL_PATH=$(realpath "../$extension_name/$ON_UNINSTALL_SCRIPT")
if [[ -x "$UNINSTALL_FULL_PATH" ]]
then
	(cd "../$extension_name" && eval "$UNINSTALL_FULL_PATH")
fi

# Remove supplies from local data
python remove-dependencies.py "$extension_name"

rm -r "../$extension_name"
