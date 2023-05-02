
# FROM kalilinux/kali-rolling 
# RUN apt update && apt install -y fakeroot bash wget make gcc build-essential

# FROM alpine:3.9
# RUN apk add --no-cache alpine-sdk build-base bash wget flex bison elfutils libelf-dev

FROM archlinux:latest

ADD ./FoxBuild/ $HOME/build/FoxBuild/

ADD ./alpine-minirootfs/ $HOME/build/alpine-minirootfs/
ADD ./linux-6.3/ $HOME/build/linux-6.3/
# ADD ./FoxBuild/zfiles/.config $HOME/build/linux-6.3/
# ADD ./runlevels/ $HOME/build/alpine-minirootfs/runlevels/
# ADD ./init.d/ $HOME/build/alpine-minirootfs/etc/runlevels/sysinit/

RUN pacman -Suy --noconfirm make gcc bash wget linux-hardened-headers fakeroot flex bison elfutils libelf diffutils bc perl ccache distcc avahi busybox

USER root
WORKDIR $HOME/build/

RUN mkdir -p /scrap/ccache
RUN export CCACHE_DIR="/scrap/ccache"
RUN export CC="distcc ccache gcc"
RUN export CXX="ccache g++"
RUN export PATH="/usr/lib/ccache:$PATH"
RUN export DISTCC_HOSTS="foxy-laptop.local,cpp,lzo"
RUN export DISTCC_VERBOSE="1"
EXPOSE 3632/tcp

# RUN bash ./FoxBuild/02_chrootandinstall.sh
 RUN mknod -m 600 alpine-minirootfs/dev/console c 5 1
# RUN chroot alpine-minirootfs /bin/ash
 ADD ./chroot.sh $HOME/build/
 RUN ./chroot.sh

RUN chmod +x ./alpine-minirootfs/init
WORKDIR $HOME/build/linux-6.3/
RUN make oldconfig
WORKDIR $HOME/build/


# RUN bash ./FoxBuild/04_build.sh

# RUN bash ./alpine-minirootfs/mk.sh

 ADD ./build.sh $HOME/build/
 RUN ./build.sh

# RUN bash ./FoxBuild/01_get.sh 
# RUN bash ./FoxBuild/02_chrootandinstall.sh
# RUN bash ./FoxBuild/03_conf.sh
# RUN bash ./FoxBuild/04_build.sh
