#!/bin/bash
set -e
VERSION=$(curl -s https://sourceforge.net/projects/nitruxos/files/latest/download | awk -F '(nitrux-nx-desktop-|-amd64.iso)' '/nitrux-nx-desktop-/ {print $2;exit}')
echo "${VERSION}"
