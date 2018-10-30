#!/usr/bin/env bash

cat ../pkg/data/remote/manifest.json  | jq -j '.extensions[] | .name," ", .path, "\n"'
