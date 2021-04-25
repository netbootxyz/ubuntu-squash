#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/lubuntu/releases/hirsute/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
