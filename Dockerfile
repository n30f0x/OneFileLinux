
#FROM kalilinux/kali-rolling 
FROM alpine:latest
RUN apk add --no-cache fakeroot bash 
RUN apk add --no-cache openrc nano mc htop tcpdump parted wpa_supplicant dropbear dropbear-ssh efibootmgr tmux exa make gcc

ADD ./build.sh $HOME/build/
ADD ./chroot.sh $HOME/build/
ADD ./FoxBuild/ $HOME/build/FoxBuild/
# ADD ./FoxBuild/zfiles/ $HOME/build/FoxBuild/
# ADD ./linux-6.3/ $HOME/build/
# ADD ./alpine-minirootfs/ $HOME/build/

USER root
WORKDIR $HOME/build/

# RUN wget https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/x86_64/alpine-minirootfs-3.17.3-x86_64.tar.gz
# RUN mkdir alpine-minirootfs
# RUN tar -C alpine-minirootfs -xf alpine-minirootfs-3.17.3-x86_64.tar.gz
# RUN wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.3.tar.xz
# RUN tar -xf linux-6.3.tar.xz
# RUN ln -s linux-6.3/ linux
# 
# 
# RUN echo "nameserver 8.8.8.8" >> alpine-minirootfs/etc/resolv.conf
# RUN echo "nameserver 8.8.4.4" >> alpine-minirootfs/etc/resolv.conf
# 
# RUN echo "apk update && apk upgrade" >> alpine-minirootfs/mk.sh
# RUN echo "apk add openrc nano mc htop tcpdump parted wpa_supplicant dropbear dropbear-ssh efibootmgr busybox-initscripts" >> alpine-minirootfs/mk.sh
# RUN chmod +x alpine-minirootfs/mk.sh
# 
# COPY /zfiles/wpa_supplicant.conf ./alpine-minirootfs/etc/wpa_supplicant/
# COPY /zfiles/interfaces ./alpine-minirootfs/etc/network/
# COPY /zfiles/resolv.conf ./alpine-minirootfs/etc/
# COPY /zfiles/profile ./alpine-minirootfs/etc/
# COPY /zfiles/shadow ./alpine-minirootfs/etc/
# COPY /zfiles/init ./alpine-minirootfs/
# RUN chmod +x ./alpine-minirootfs/init
# 
# 
# RUN mkdir -p alpine-minirootfs/lib/
# RUN tar -C alpine-minirootfs/lib/ -xf zfiles/firmware.tar.xz
# RUN cp zfiles/.config linux/
# 
# WORKDIR $HOME/build/linux
# RUN make oldconfig

RUN bash ./FoxBuild/01_get.sh 
RUN bash ./FoxBuild/02_chrootandinstall.sh
# RUN bash ./FoxBuild/03_conf.sh
# RUN bash ./FoxBuild/04_build.sh

# WORKDIR $HOME/build/
# RUN bash ./chroot.sh
 RUN bash ./build.sh
