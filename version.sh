#!/bin/bash
set -e
VERSION=$(curl -sL https://cdimage.ubuntu.com/releases/21.10/beta/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
