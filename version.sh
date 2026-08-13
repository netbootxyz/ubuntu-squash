#!/bin/bash
set -e
VERSION=$(curl https://api.pop-os.org/builds/20.04/intel 2> /dev/null | jq -r .build)
echo "${VERSION}"
