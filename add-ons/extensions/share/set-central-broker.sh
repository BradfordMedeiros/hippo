#!/usr/bin/env bash

if [[ -z "$1" ]]; then
	1>&2 echo "not yet set"
	exit 1
fi

BROKER="$1"
echo "$BROKER" > broker
