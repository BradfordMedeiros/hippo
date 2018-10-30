#!/usr/bin/env bash

cat ../pkg/data/remote/manifest.json | jq -r .extensions[].name
