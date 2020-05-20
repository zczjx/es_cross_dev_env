#!/bin/bash
if [ $# -lt 1 ]; then
echo "usage: ./docker_build.sh [arm | armv8l | aarch64]"
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
echo "toolchain: $toolchain"
docker build -t ${arch}_host_ubuntu:18.04 \
--build-arg arch=${arch} \
--build-arg toolchain=${toolchain} \
-f Dockerfile.ubuntu_18_04 .