# debian-image-recipes for Rockchip RK3588 boards

Debos recipes to build Debian images for Rockchip rk3588-based boards.

Currently, only the ROCK 5 Model B is supported by the images.

These images can be flashed to an SD card or eMMC.

## Prebuilt images
See the [CI/CD pipelines](https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-image-recipes/-/pipelines)
to download prebuilt images for your target. Extract the archive somewhere.

## Install to SD card
Copy the image to an SD card using `bmaptool`:
```
$ bmaptool copy image-rockchip-rock5b-rk3588.img.gz /dev/mmcblk0
```

## Install to eMMC
It is recommended to use `rockusb` from the [rockchiprs](https://github.com/collabora/rockchiprs)
Rust crate. It can be installed with:
```
$ cargo install rockusb --example rockusb
```

Press & hold the board's [maskrom button](https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/rock5b-rk3588.md#maskrom) before applying power. Once the board is in maskrom mode, release the button.

```
$ rockusb list
Available rockchip devices
* Bus 006 Device 014: ID 2207:350b

$ rockusb download-boot rk3588_spl_loader_v1.08.111.bin
0 Name: UsbHead
Done!... waiting 1ms
1 Name: rk3588_ddr_lp4_2112M
Done!... waiting 1ms
0 Name: rk3588_usbplug_v1
Done!... waiting 0ms

$ rockusb write-bmap image-rockchip-rock5b-rk3588.img.gz

$ rockusb reset
```

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
