#!/bin/bash
set -e
VERSION=$(curl -sL http://downloads.pureos.net/byzantium/gnome/ | grep -o "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | tail -n1)
echo "${VERSION}"
