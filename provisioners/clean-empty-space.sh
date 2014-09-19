#!/bin/bash

if [ "${PACKER_BUILDER_TYPE}" != "virtualbox-iso" ]; then
  exit
fi

set -x

# Saves ~25M
yum -y remove kernel-devel

# Clean cache
yum clean all

# Clean out all of the caching dirs
rm -rf /var/cache/* /usr/share/doc/*

# Clean up unused disk space so compressed image is smaller.
cat /dev/zero > /tmp/zero.fill
sync
sleep 1
sync
rm /tmp/zero.fill
sync
sleep 1
sync
