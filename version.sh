#!/bin/bash
set -e
VERSION=$(curl -sL https://cdimage.ubuntu.com/releases/26.04/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
