#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/xubuntu/releases/hirsute/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
