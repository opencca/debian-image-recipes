#!/bin/bash

#
# - run ssh-kegen to generate ssh keys
# - run ssh-copy-id to copy key to remote host
# - change host and path
#

host=${host-user@host}
path=${path:-/path/on/remote/host}

sudo sshfs -o allow_other,default_permissions $host:$path /mnt -o IdentityFile=/home/user/.ssh/id_rsa
