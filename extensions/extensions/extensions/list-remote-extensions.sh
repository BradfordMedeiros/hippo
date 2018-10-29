#!/usr/bin/env bash

cat ../pkg/data/remote/manifest.json | jq .extensions[].name
