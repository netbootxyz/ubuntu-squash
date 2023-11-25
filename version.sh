#!/bin/bash
set -e
VERSION="$(curl -sL https://www.bodhilinux.com/download/ | grep "Standard Edition" | awk '{print $3}')"
echo "${VERSION}"
