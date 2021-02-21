#!/bin/bash
set -e
VERSION=$(curl -s https://sourceforge.net/projects/nitruxos/files/latest/download | awk -F '(nitrux-release-amd64_|.iso)' '/nitrux-release-amd64_/ {print $2;exit}')
echo "${VERSION}"
