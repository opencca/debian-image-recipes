#!/bin/sh
# Installs Mali firmware and libmali OpenCL ICD onto a running Rock 5B system.
# Run as root from this directory.
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
apt-get install -y libxcb-dri2-0
cp "$SCRIPT_DIR/mali_csffw.bin" /lib/firmware/mali_csffw.bin
dpkg -i "$SCRIPT_DIR/libmali-valhall-g610-g13p0-x11-gbm_1.9-1_arm64.deb"

# Fix potential conflict with existing Mesa drivers
rm -f /etc/ld.so.conf.d/00-aarch64-mali.conf
rm -f /etc/profile.d/mali-priority.sh
ln -sf /usr/lib/aarch64-linux-gnu/mali/libMaliOpenCL.so.1 \
        /usr/lib/aarch64-linux-gnu/libMaliOpenCL.so.1
ldconfig

# Allow non-root users in the video group to access /dev/mali0
cat > /etc/udev/rules.d/50-mali.rules << 'EOF'
SUBSYSTEM=="mali", MODE="0660", GROUP="video"
EOF
udevadm control --reload-rules
udevadm trigger

apt-get install -y opencl-headers clinfo

usermod -aG video $USER
echo "Done. Make sure to run `newgrp video`"
echo "Verify with: clinfo"
