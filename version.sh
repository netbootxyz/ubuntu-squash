#!/bin/bash
set -e
VERSION=$(curl -sL https://cdimage.ubuntu.com/releases/25.04/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
