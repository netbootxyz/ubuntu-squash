#!/bin/bash
set -e
VERSION="$(curl -sL https://linux.backbox.org/download/ | grep -i File | grep -i iso | awk -F'-' '{print $2}')"
echo "${VERSION}"
