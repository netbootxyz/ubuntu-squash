#!/bin/bash
set -e
VERSION=$(curl -s https://sourceforge.net/projects/lxle/files/latest/download | awk -F '(OS/|-64)' '/lxle-/ {print $2}')
echo "${VERSION}"
