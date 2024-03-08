#!/bin/sh

adduser --gecos user \
  --disabled-password \
  --shell /bin/bash \
  user
adduser user sudo
adduser user video
adduser user render
adduser user input
adduser user audio
echo "user:user" | chpasswd
