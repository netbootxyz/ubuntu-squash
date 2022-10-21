#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntukylin/releases/kinetic/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
