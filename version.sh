#!/bin/bash
set -e
VERSION=$(curl -sL http://releases.ubuntu.com/24.04/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
