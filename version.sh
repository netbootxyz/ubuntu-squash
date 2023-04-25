#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntu-mate/releases/lunar/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
