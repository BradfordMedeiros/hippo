#!/usr/bin/env bash

# Registers a udev rule to call handle_usb_hook.sh
cat 10-usbplugin.rules.template | sed "s|{{EXECUTABLE}}|$(pwd)/handle_usb_hook.sh|g" > /etc/udev/rules.d/10-usbplugin.rules

