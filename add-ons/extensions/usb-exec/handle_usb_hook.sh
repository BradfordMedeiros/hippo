#!/usr/bin/env bash

HOOK_HANDLERS=$(cat hooks | cut -d " " -f 2-)

echo "$HOOK_HANDLERS" | awk '{ system($0) }'
