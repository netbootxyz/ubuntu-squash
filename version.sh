#!/bin/bash
set -e
VERSION=$(curl -sL https://neon.kde.org/download | grep -i iso | head -n 1 | awk -F '/' '{print $7}')
echo "${VERSION}"
