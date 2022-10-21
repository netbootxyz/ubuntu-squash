#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntu-mate/releases/kinetic/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
