#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/kubuntu/releases/groovy/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
