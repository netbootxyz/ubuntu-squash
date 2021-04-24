#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/kubuntu/releases/hirsute/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
