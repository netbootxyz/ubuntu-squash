#!/bin/bash
set -e
VERSION=$(curl -s https://sourceforge.net/projects/nitruxos/files/Release/ | awk -F '(nitrux-release-amd64_|.iso)' '/nitrux-release-amd64_/ {print $2}' | tail -n 1)
echo "${VERSION}"
