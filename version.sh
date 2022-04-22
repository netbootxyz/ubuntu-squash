#!/bin/bash
set -e
VERSION=$(curl -sL http://cdimage.ubuntu.com/ubuntu-budgie/releases/jammy/release/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
