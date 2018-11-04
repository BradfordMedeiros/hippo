#!/usr/bin/env bash

cat /etc/hosts | grep "#$(<hippo-id)" | awk '{ printf $0; }'

