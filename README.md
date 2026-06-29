# OpenCCA debian-image-recipes

> This is a fork of [Collabora's debian-image-recipes ](https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-image-recipes) for OpenCCA.
> See original readme in [./README.upstream.md](./README.upstream.md).

OpenCCA Root Filesystem  
https://opencca.github.io/

### Mali Drivers

To install the userspace drivers on an existing install that uses the 6.12 kernel with kbase support, copy the mali directory to the device and run `install-mali-opencl.sh`

This also adds your user to the 'video' group.
To apply the change in the current session run:

`newgrp video`

OpenCL should then work without rebooting.

### Prepare
```
# Download prebuilt linux and firmware

./download-rock5b-opencca-artifacts.sh
```

See build helper in opencca-build/buildconf for build.
