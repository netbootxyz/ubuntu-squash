#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntu-budgie/releases/hirsute/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
