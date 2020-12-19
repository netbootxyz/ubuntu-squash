#!/bin/bash
set -e
VERSION=$(curl -sL http://mirror.us.leaseweb.net/ubuntu-cdimage/kubuntu/releases/18.04/release/SHA256SUMS | awk '{ print $2}' | grep -Po "(\d+\.)+\d+" | sort | tail -1)
echo "${VERSION}"
