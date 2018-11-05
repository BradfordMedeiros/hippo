#!/usr/bin/env bash

HOOKNAME=$1
HOOKSCRIPT="${@:2}"

if [[ -z "$HOOKNAME" || -z "$HOOKSCRIPT" ]]; then
	echo "Invalid parameters"
	exit 1
fi

echo "$HOOKNAME $HOOKSCRIPT" >> hooks
