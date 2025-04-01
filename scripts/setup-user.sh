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

echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/99_nopasswd_sudo
