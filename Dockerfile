

ADD build.sh $HOME/build/
ADD chroot.sh $HOME/build/
ADD FoxBuild $HOME/build/FoxBuild


#FROM kalilinux/kali-rolling 
FROM alpine:3.17.3 
RUN apk add --no-cache fakeroot bash 
RUN apk add --no-cache openrc mdev defs dmesg syslog hwdrivers

USER root
#WORKDIR $HOME/build/
WORKDIR $HOME/build/FoxBuild/
RUN bash ./01_get.sh 
RUN bash ./02_chrootandinstall.sh

RUN bash ./03_conf.sh
RUN bash ./04_build.sh

#RUN bash ./chroot.sh
#RUN bash ./build.sh
