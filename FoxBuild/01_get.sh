#/bin/bash

alpineminirootfsfile="alpine-minirootfs-3.11.6-x86_64.tar.gz"
linuxver="linux-5.6.8"

wget -4 https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/x86_64/alpine-minirootfs-3.17.3-x86_64.tar.gz
mkdir alpine-minirootfs
tar -C ./alpine-minirootfs -xf $alpineminirootfsfile
wget -4 https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.2.tar.xz
tar -xf $linuxver.tar.xz

ln -s $linuxver linux
