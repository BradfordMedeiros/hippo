#!/usr/bin/env bash

CONTAINER_ID=$(docker container ls | grep bradfordmedeiros/automate_arm_0.7.0 | awk '{ print $1 }')
IMAGE_ID=$(docker images | grep bradmedeiros/automate_arm_0.7.0 | awk '{ print $1 }')

docker kill "$CONTAINER_ID"
docker rmi -f "$IMAGE_ID"
