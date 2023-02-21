# debian-image-recipes for Rockchip RK3588 boards

Debos recipes to build Debian images for Rockchip rk3588-based boards.

These images should boot when flashed to an SD card or eMMC.

## Prebuilt images
See the [CI/CD pipelines](https://gitlab.collabora.com/hardware-enablement/rockchip-3588/-/pipelines)
to download prebuilt images for your target.


## System requirements
On a Debian (bookworm preferred) system, install debos:
```bash
$ sudo apt install debos
```


## Locally build images
The first stage is to build a generic (but architecture-specific) ospack, then
assemble the ospack into multiple hardware-specific images.

Linux kernel and u-boot binaries for your specific platform needs to be copied
into the `prebuilt` directory. See `download-rk3588-artifacts.sh` for the directory
layout.


```bash
$ ./download-rk3588-artifacts.sh
$ mkdir out
$ debos --artifactdir=out -t architecture:arm64 ospack-debian.yaml
$ debos --artifactdir=out -t architecture:arm64 -t platform:rock5b-rk3588 image-rockchip-rk3588.yaml
```
