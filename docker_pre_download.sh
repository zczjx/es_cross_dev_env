#!/bin/bash

# toolchain
dl_dir=toolchain/

# arm-linux-gnueabihf
dl_file=gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
if [ ! -f ${dl_dir}${dl_file} ];then
echo $dl_file
wget -P $dl_dir https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/$dl_file
fi

# armv8l-linux-gnueabihf
dl_file=gcc-linaro-7.5.0-2019.12-x86_64_armv8l-linux-gnueabihf.tar.xz
if [ ! -f ${dl_dir}${dl_file} ];then
wget -P $dl_dir https://releases.linaro.org/components/toolchain/binaries/latest-7/armv8l-linux-gnueabihf/$dl_file
fi

# aarch64-linux-gnu
dl_file=gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz
if [ ! -f ${dl_dir}${dl_file} ];then
wget -P $dl_dir https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/$dl_file
fi

# cmake
cmake_version=3.17.2
dl_file=cmake-${cmake_version}-Linux-x86_64.sh
if [ ! -f ${dl_dir}${dl_file} ] ;then
wget -P $dl_dir https://github.com/Kitware/CMake/releases/download/v${cmake_version}/$dl_file
chmod +x $dl_file
fi

# workspace
dl_dir=workspace/

dl_file=buildroot-es_udk
if [ ! -d ${dl_dir}${dl_file} ];then
git clone https://github.com/zczjx/buildroot-es_udk.git ${dl_dir}${dl_file}
fi

# 3rd-pkg
dl_dir=3rd-pkg/

echo "finish all files download"
