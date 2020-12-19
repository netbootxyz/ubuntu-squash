#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntukylin/releases/focal/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
