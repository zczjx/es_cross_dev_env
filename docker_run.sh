#!/bin/bash

if [ $# -lt 3 ]; then
echo "usage: ./docker_run.sh [arm | armv8l | aarch64] \
[workspace path exam: /home/$USER/workspace] \
[3rd-pkg path exam: /home/$USER/3rd-pkg]"
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
--mount type=bind,source=$2,target=/workspace \
--mount type=bind,source=$3,target=/home/${username}/3rd-pkg \
--privileged ${arch}_host_ubuntu:18.04
