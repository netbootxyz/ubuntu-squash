#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntu-mate/releases/impish/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
