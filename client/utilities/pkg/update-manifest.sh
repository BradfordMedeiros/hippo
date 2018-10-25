#!/usr/bin/env bash

URL=$(cat ./data/remote/localserver | jq -r .url)/manifest.json
curl -o ./data/remote/manifest.json -f "$URL"
