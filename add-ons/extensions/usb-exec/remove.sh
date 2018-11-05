#!/usr/bin/env bash

HOOKNAME=$1

if [[ -z "$HOOKNAME" ]]; then
	echo "Invalid parameters"
	exit 1
fi

new_hooks=$(cat ./hooks | grep -v "^$HOOKNAME ")

if [[ -z "$new_hooks" ]]; then
	printf "" > hooks
else 
	echo "$new_hooks" > hooks
fi 
