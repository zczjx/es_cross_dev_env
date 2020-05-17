FROM ubuntu:18.04
ARG uid=1000
ARG gid=1000
ARG username=armlinux
COPY config/sources.list /etc/apt
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    software-properties-common \
    apt-utils \
    && apt-get install -y \
    sudo \
    libcurl4-openssl-dev \
    wget \
    libncurses5-dev \
    ncurses-dev \
    autoconf \
    automake \
    zlib1g-dev \
    pkg-config \
    ssh \
    pbzip2 \
    pv \
    bzip2 \
    unzip \
    net-tools \
    make \
    curl \
    dpkg \
    lzma \
    gettext \
    texinfo \
    gawk \
    nfs-kernel-server \
    nfs-common \
    portmap \
    rpcbind \
    runit \
    inotify-tools \
    vim \
    ctags \
    git

# Install Cmake
# RUN cd /tmp && \
#    wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4-Linux-x86_64.sh && \
#    chmod +x cmake-3.14.4-Linux-x86_64.sh && \
#   ./cmake-3.14.4-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license && \
#    rm ./cmake-3.14.4-Linux-x86_64.sh

COPY config/exports /etc
EXPOSE 111/udp 2049/tcp 4046/udp

RUN groupadd -r -f -g ${gid} ${username} \
    && useradd -u ${uid} -g ${gid} -G sudo -m ${username} \
    && echo 'root:123456' | chpasswd \
    && echo ${username}:123456 | chpasswd \
    && usermod -aG sudo ${username} \
    && mkdir -p /workspace && chown ${username} /workspace \
    && mkdir -p /home/${username}/.vim

WORKDIR /workspace
USER ${username}
COPY config/.bashrc /home/${username}
COPY config/.gitconfig /home/${username}
COPY config/.vimrc /home/${username}
COPY config/.vim/* /home/${username}/.vim/
CMD /bin/bash