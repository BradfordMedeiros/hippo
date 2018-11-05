#!/usr/bin/env bash

extension_info=$(./list-remote-extensions.sh | grep $1 | head -n 1)
extension_name=$(echo "$extension_info" | awk '{ print $1 }')
extension_url=$(echo "$extension_info" | awk '{ print $2 }')
output_directory="../$extension_name"
temp_output_archive="../../local_data/tmp/$(cat /dev/urandom 2>/dev/null | tr -cd 'a-f0-9' 2>/dev/null | head -c 32 2>/dev/null)"

if [ $(id -u) != 0 ]
then	
	echo "Install extension must be run as root"
	exit 1
fi

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

#Download tar to temp directory 
curl -o "./$temp_output_archive" -f "$extension_url"

# Unzip the tar and delete it
mkdir "$output_directory" && tar -C "$output_directory" -xvf "$temp_output_archive" && rm "$temp_output_archive"

# Only install extension if the supplies are unique
# For example, if an extensions supplies etcd_automated, we cannot install another module
# that supplies that same thing
for supply in $(cat "$output_directory/command-surface.json" | jq -r .supplies[]); do
	if [[ -n "$(cat ../../local_data/deps | grep "^$supply$")" ]];
	then 
		echo "dependency already installed for what this supplies, not installing"
		rm -r "$output_directory"
		exit 1
	fi
done

# Only install extension if all deps are met 
for dep in $(cat "$output_directory/command-surface.json" | jq -r .depends[]); do
	if [[ -z "$(cat ../../local_data/deps | grep "^$dep$")" ]];
	then 
		echo "depends not met not, not installing"
		rm -r "$output_directory"
		exit 1
	fi
done

# Add supplies to local_data/deps
cat "$output_directory/command-surface.json" | jq -r .supplies[] >> ../../local_data/deps
NEW_DEPS=$(cat ../../local_data/deps | sort | uniq)
echo "$NEW_DEPS" > ../../local_data/deps


# Execute install script if it exists
ON_INSTALL_SCRIPT=$(cat "$output_directory/command-surface.json" | jq -r '.on_install')
INSTALL_FULL_PATH=$(realpath "$output_directory/$ON_INSTALL_SCRIPT")
if [[ -x "$INSTALL_FULL_PATH" ]]
then
	(cd "$output_directory" && eval "$INSTALL_FULL_PATH")
fi
