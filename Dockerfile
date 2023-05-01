
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


RUN bash ./FoxBuild/01_get.sh 
RUN bash ./FoxBuild/02_chrootandinstall.sh
# RUN bash ./FoxBuild/03_conf.sh
# RUN bash ./FoxBuild/04_build.sh

# WORKDIR $HOME/build/
# RUN bash ./chroot.sh
 RUN bash ./build.sh
