#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntu-budgie/releases/mantic/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
