# debian-image-recipes

A collection of Debos recipes to build Debian images for various targets.

By default the recipes support Bookworm (i.e. the latest testing) and would need
additional modifications to support Bullseye.

## Contribution
Contributions welcome in form of issues for bugs or merge requests for patches.

## System requirements
On a Debian (bookwork preferred) system, install debos:
```bash
sudo apt install debos
```

## Build images
Build the images like:

```bash
mkdir out
debos --artifactdir=out -t architecture:arm64 ospack-debian.yaml
debos --artifactdir=out image-rockchip.yaml
```
