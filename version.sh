#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntukylin/releases/mantic/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
