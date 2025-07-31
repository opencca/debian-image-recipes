#!/bin/bash

sudo lkvm run  --realm --restricted_mem --disable-sve -c 1 -m 512m -p "debug loglevel=8"
