#!/bin/bash
set -e
VERSION=$(curl -sL http://releases.ubuntu.com/impish/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
