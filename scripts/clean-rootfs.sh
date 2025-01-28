#!/bin/sh
# Remove first boot related files so that we don't
# duplicate machine-ids, random seeds and host keys
set -e

# Remove SSH keys and machine ID so they get generated on first boot,
# also the random seed and credential.secret
# Ref: https://systemd.io/BUILDING_IMAGES/
rm -f /etc/ssh/ssh_host_* \
      /etc/machine-id \
      /var/lib/dbus/machine-id \
      /var/lib/systemd/random-seed \
      /var/lib/systemd/credential.secret
# Make /etc/machine-id an empty file. This way systemd can bind-mount onto it,
# and fill it with a machine-id, but it won't trigger `ConditionFirstBoot`.
touch /etc/machine-id
