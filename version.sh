#!/bin/bash
set -e
VERSION=$(curl -s https://linuxmint.com/download.php | grep -i "Download Linux Mint" | awk {'print $4'})
echo "${VERSION}"
