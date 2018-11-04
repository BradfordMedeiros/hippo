#!/usr/bin/env bash

HIPPO_ID=$(<hippo-id)
hostname="$1"

file_hash_begin=$(md5sum /etc/hosts)

NEW_HOST_FILE=$(cat /etc/hosts | grep -v  "($hostname #$HIPPO_ID)") 
echo "$NEW_HOST_FILE" > /etc/hosts

file_hash_end=$(md5sum /etc/hosts)

if [[ "$file_hash_begin" == "$file_hash_end" ]];
then 
	echo "host does not exist"
	exit 1
else 
	echo "yay"
fi 
