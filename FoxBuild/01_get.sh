#/bin/bash

alpineminirootfsfile="alpine-minirootfs-3.17.3-x86_64"
linuxmain="v6.x"
linuxexact="linux-6.3"


wget -4 https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/x86_64/$alpineminirootfsfile.tar.gz
mkdir alpine-minirootfs
tar -C alpine-minirootfs -xf $alpineminirootfsfile.tar.gz
wget -4 https://cdn.kernel.org/pub/linux/kernel/$linuxmain/$linuxexact.tar.xz
tar -xf $linuxexact.tar.xz

ln -s $linuxexact linux
