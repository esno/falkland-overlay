#!/bin/sh

export PATH="/bin"

##
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devtmpfs none /dev
mkdir /dev/pts && mount -t devpts devpts /dev/pts
##

##
CMDLINE=$(cat /proc/cmdline)

source /etc/initram.cfg
test -z "${LVMDEV}" && LVMDEV="/dev/sda2"
##

##
cryptsetup luksOpen ${LVMDEV} luks0
vgchange -ay vg0
vgmknodes

mount /dev/mapper/vg0-${LVNAME} /newroot
##

##
umount /dev/pts
rmdir /dev/pts
umount /proc /sys /dev

exec /bin/busybox switch_root /newroot /sbin/init $CMDLINE
