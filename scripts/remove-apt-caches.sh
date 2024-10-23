#!/bin/sh
set -e

echo "Dropping /var/lib/apt/lists caches"
rm -f /var/lib/apt/lists/*Packages
rm -f /var/lib/apt/lists/*Sources
rm -f /var/lib/apt/lists/*Release
rm -f /var/lib/apt/lists/*Release.gpg
rm -f /var/lib/apt/lists/*Translation*

echo "Dropping /var/cache/apt caches"
rm -f /var/cache/apt/pkgcache.bin
rm -f /var/cache/apt/srcpkgcache.bin
