#!/bin/bash
set -e
VERSION=$(curl -s https://www.linuxliteos.com/download.php | grep "UEFI/LEGACY" | awk -F '(linux-lite-|-64bit.iso)' '/linux-lite-/ {print $2;exit}')
echo "${VERSION}"
