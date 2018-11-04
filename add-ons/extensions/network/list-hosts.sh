#!/usr/bin/env bash

cat /etc/hosts | grep "#$(<hippo-id)" | awk '{ print $0; }'

