#!/bin/bash
set -e
VERSION=$(curl -sL https://zorin.com/os/download/ | grep Core | grep -v subscribe | head -n 1 | awk -F' ' {'print $6'} | awk -F'<' {'print $1'})
echo "${VERSION}"
