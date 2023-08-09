#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy UTC Datetime
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon 🕛
# @raycast.packageName Phil's Utils
#
# Documentation:
# @raycast.description Copies datetime to clipboard
# @raycast.author Phil Stainer
# @raycast.authorURL https://github.com/philstainer

timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo $timestamp | pbcopy
echo $timestamp