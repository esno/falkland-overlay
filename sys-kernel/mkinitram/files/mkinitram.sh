#!/bin/sh

TMPDIR=$(mktemp -d)

# create directories
mkdir \
  $TMPDIR/bin \
  $TMPDIR/boot \
  $TMPDIR/dev \
  $TMPDIR/etc \
  $TMPDIR/lib \
  $TMPDIR/lib/modules \
  $TMPDIR/newroot \
  $TMPDIR/proc \
  $TMPDIR/root \
  $TMPDIR/run \
  $TMPDIR/sys \
  $TMPDIR/tmp \
  $TMPDIR/usr \
  $TMPDIR/usr/lib \
  $TMPDIR/var \
  $TMPDIR/var/log \
  $TMPDIR/var/run \

ln -s lib $TMPDIR/lib64
ln -s lib $TMPDIR/usr/lib64

# create device nodes
mknod -m 600 $TMPDIR/dev/console c 5 1
mknod -m 666 $TMPDIR/dev/urandom c 1 9
mknod -m 666 $TMPDIR/dev/random  c 1 8
mknod -m 640 $TMPDIR/dev/mem     c 1 1
mknod -m 666 $TMPDIR/dev/null    c 1 3
mknod -m 666 $TMPDIR/dev/tty     c 5 0
mknod -m 666 $TMPDIR/dev/zero    c 1 5
mknod -m 640 $TMPDIR/dev/tty1    c 4 1

###
#todo: reference files in rootfs and ldd -v all depending libs
###
# copy binariies
BINARIES="/bin/busybox /sbin/cryptsetup /sbin/lvm"

for b in $BINARIES; do
  cp $b $TMPDIR/bin
  for l in $(ldd $b | sed -nre 's,.* (/.*lib.*/.*.so.*) .*,\1,p' -e 's,.*(/lib.*/ld.*.so.*) .*,\1,p'); do
  cp $l $TMPDIR/lib
  done
done

cp /usr/share/mkinitram/init.sh $TMPDIR/init

# create symlinks
ln -s busybox $TMPDIR/bin/awk
ln -s busybox $TMPDIR/bin/cat
ln -s busybox $TMPDIR/bin/echo
ln -s busybox $TMPDIR/bin/egrep
ln -s busybox $TMPDIR/bin/grep
ln -s busybox $TMPDIR/bin/hexdump
ln -s busybox $TMPDIR/bin/hostname
ln -s busybox $TMPDIR/bin/ifconfig
ln -s busybox $TMPDIR/bin/kill
ln -s busybox $TMPDIR/bin/ls
ln -s busybox $TMPDIR/bin/mount
ln -s busybox $TMPDIR/bin/sh
ln -s busybox $TMPDIR/bin/test
ln -s busybox $TMPDIR/bin/umount

ln -s lvm $TMPDIR/bin/vgscan
ln -s lvm $TMPDIR/bin/vgchange
ln -s lvm $TMPDIR/bin/vgmknodes

LINUXVERSION=$(ls -t /lib/modules/ | head -n 1)
cp -rf /lib/firmware $TMPDIR/lib
cp -rf /lib/modules/$LINUXVERSION $TMPDIR/lib/modules

# create config
echo "root:x:0:0:root:/root:/bin/sh" > $TMPDIR/etc/passwd
echo "root:x:0:root" > $TMPDIR/etc/group
echo "root:!:10770:0:::::" > $TMPDIR/etc/shadow

cp /etc/initram.cfg $TMPDIR/etc/initram.cfg

chmod 744 $TMPDIR/init

# create initramfs
TMPCD=$(pwd)
cd $TMPDIR && find . -print0 | cpio --null -ov --format=newc | gzip -9 > $TMPCD/initram.gz && cd $TMPCD

rm -rf $TMPDIR
