#!/usr/bin/env bash
REMOTE_URL=$1
DESCRIPTION=$2

if [[ -z "$REMOTE_URL" ]]; then
	echo "remote url undefined"
	exit 1
fi 

json_object="{ \"url\": \"$REMOTE_URL\", \"description\": \" $DESCRIPTION\"}"

echo "$json_object" > ./data/remote/localserver

./update-manifest.sh
