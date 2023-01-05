# debian-image-recipes

A collection of Debos recipes to build Debian images for various targets.

By default the recipes support Bookworm (i.e. the latest testing) and would need
additional modifications to support Bullseye.

## Contribution
Contributions welcome in form of issues for bugs or merge requests for patches.

## System requirements
On a Debian (bookwork preferred) system, install debos:
```bash
$ sudo apt install debos
```

## Prebuilt images
See the [CI/CD pipelines](https://gitlab.collabora.com/obbardc/debian-image-recipes/-/pipelines)
to download prebuilt images for your target.

## Locally build images
The image recipes support multiple platforms.

The first stage is to build a generic (but architecture-specific) ospack, then
assemble the ospack into multiple hardware-specifc images.

The following example commands build generic images for both the [ROCK Pi 4](https://rockpi.org/rockpi4)
and the [Firefly ROC-RK3399-PC](https://en.t-firefly.com/product/rocrk3399pc).

These images should boot when flashed to an SD card.

```bash
$ mkdir out
$ debos --artifactdir=out -t architecture:arm64 ospack-debian.yaml
$ debos --artifactdir=out -t architecture:arm64 -t platform:rock-pi-4-rk3399 image-rockchip.yaml
$ debos --artifactdir=out -t architecture:arm64 -t platform:roc-pc-rk3399 image-rockchip.yaml
```
