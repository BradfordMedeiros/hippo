#!/usr/bin/env bash

docker run -p 1883:1883 -d --name hippo.mqtt_broker eclipse-mosquitto:1.5.5

