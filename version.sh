#!/bin/bash
set -e
VERSION=$(curl -s https://sourceforge.net/projects/bodhilinux/files/latest/download | awk -F 'bodhi-|-64.iso' '/bodhilinux/ {print $2;exit}')
echo "${VERSION}"
