#!/bin/bash
set -e
VERSION=$(curl -sL http://releases.ubuntu.com/noble/ |grep '<title>' | grep -Po "(\d+\.)+\d+")
echo "${VERSION}"
