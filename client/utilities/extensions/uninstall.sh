#!/usr/bin/env bash

# this is unsafe since we don't escape input in any way
extension_name=$1
rm -r "../$extension_name"