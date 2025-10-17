#!/bin/bash
set -e
VERSION=$(curl -sL https://cdimage.ubuntu.com/releases/25.10/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
