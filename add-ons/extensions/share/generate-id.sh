#!/usr/bin/env bash

ID=$(cat unique_id 2> /dev/null)

if [[ -z "$ID" ]]; then
    ID=$(cat /proc/sys/kernel/random/uuid)
    echo "$ID" > unique_id
fi 

echo "$ID"
