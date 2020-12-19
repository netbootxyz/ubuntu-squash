#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntu-budgie/releases/groovy/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
