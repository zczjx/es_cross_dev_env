#!/bin/bash
if [ $# -lt 1 ]; then
echo "usage: ./docker_build.sh [arm | armv8l | aarch64]"
exit 1
fi
arch=$1

if [ $arch == "arm" ]; then
toolchain=gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf
toolchain_dir=gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf
elif [ $arch == "armv8l" ]; then
toolchain=gcc-linaro-7.5.0-2019.12-x86_64_armv8l-linux-gnueabihf
toolchain_dir=gcc-linaro-7.5.0-2019.12-x86_64_armv8l-linux-gnueabihf
elif [ $arch == "aarch64" ]; then
toolchain=gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu
toolchain_dir=gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu
else
echo "arch: $arch is not match the toolchain"
exit 1
fi
echo "toolchain: $toolchain"
docker build -t ${arch}_host_ubuntu:18.04 \
--build-arg arch=${arch} \
--build-arg toolchain=${toolchain} \
--build-arg toolchain_dir=${toolchain_dir} \
-f Dockerfile.ubuntu_18_04 .