#!/bin/bash

sudo lkvm run  --realm --restricted_mem --disable-sve -c 1 -m 100m -p "debug loglevel=8"