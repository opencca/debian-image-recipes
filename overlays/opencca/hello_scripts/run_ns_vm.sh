#!/bin/bash

sudo lkvm run  --disable-sve -c 1 -m 512m -p "debug loglevel=8"
