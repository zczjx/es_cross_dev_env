#!/bin/bash

if [ $# -lt 1 ]; then
echo "usage: ./docker_run.sh [arm | armv8l | aarch64]"
exit 1
fi
arch=$1

if [ $arch == "arm" ]; then
toolchain=gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar
elif [ $arch == "armv8l" ]; then
toolchain=gcc-linaro-7.5.0-2019.12-x86_64_armv8l-linux-gnueabihf.tar
elif [ $arch == "aarch64" ]; then
toolchain=gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar
else
echo "arch: $arch is not match the toolchain"
exit 1
fi

username=git
docker run -it \
-v /dev:/dev \
-v /home/${USER}/github/nfs/:/workspace \
-v /home/${USER}/github/es_cross_dev_env/3rd-pkg:/home/${username}/3rd-pkg \
--privileged ${arch}_host_ubuntu:18.04
