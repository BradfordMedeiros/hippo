#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd "$DIR"
HOOK_HANDLERS=$(cat hooks | cut -d " " -f 2-)

echo "$HOOK_HANDLERS" | awk '{ system($0) }'
