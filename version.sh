#!/bin/bash
set -e
VERSION=$(curl -sX GET "https://api.github.com/repos/peppermintos/Peppermint-10/releases/latest" | awk '/tag_name/{print $4;exit}' FS
echo "${VERSION}"
