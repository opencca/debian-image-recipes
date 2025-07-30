#!/bin/bash
#
# Downloads the latest artifacts from opencca github for the Radxa Rock 5B
# image build
#
set -euo pipefail
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
PREBUILD_DIR=$SCRIPT_DIR/prebuilt

# Refuse to overwrite already existing prebuilt directory
if [ -d "$PREBUILD_DIR" ] ; then
    echo "ERROR: prebuilt directory exists. Removing..."
    rm $PREBUILD_DIR -rf
fi

FIRMWARE_BRANCH=opencca/main
FIRMWARE_URL="https://github.com/opencca/opencca-releases/releases/download/firmware/snapshot/${FIRMWARE_BRANCH}/latest/firmware.tar.gz"

LINUX_BRANCH=opencca/next
LINUX_URL="https://github.com/opencca/opencca-releases/releases/download/linux/snapshot/${LINUX_BRANCH}/latest/linux.tar.gz"

set -x

#
# Destination:
#
# prebuilt/linux/*deb
# prebuilt/u-boot-rock5b-rk3588/
#
mkdir -p $PREBUILD_DIR

cd $PREBUILD_DIR
wget  --show-progress -O firmware.tar.gz "$FIRMWARE_URL"
mkdir $PREBUILD_DIR/u-boot-rock5b-rk3588

cd $PREBUILD_DIR/u-boot-rock5b-rk3588/
tar -xf ../firmware.tar.gz --strip-components=1
ls -al 

cd $PREBUILD_DIR
wget  --show-progress -O linux.tar.gz "$LINUX_URL"
mkdir $PREBUILD_DIR/linux

cd $PREBUILD_DIR/linux
tar -xf ../linux.tar.gz --strip-components=1
mv $PREBUILD_DIR/linux/debian/* .
ls -al


