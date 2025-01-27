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
# Make machine-id uninitialized. This way, the ConditionFirstBoot systemd unit
# condition works as expected, and the board the image was flashed to gets its
# own unique machine-id.
touch /etc/machine-id
echo "uninitialized" > /etc/machine-id
