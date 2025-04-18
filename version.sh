#!/bin/bash
set -e
VERSION=$(curl -sL http://releases.ubuntu.com/plucky/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
