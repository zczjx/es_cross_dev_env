FROM ubuntu:18.04
ARG uid=1000
ARG gid=1000
ARG username=armlinux
COPY config/sources.list /etc/apt
RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y \
    sudo

RUN groupadd -r -f -g ${gid} ${username} \
    && useradd -u ${uid} -g ${gid} -G sudo -m ${username} \
    && echo 'root:123456' | chpasswd \
    && echo ${username}:123456 | chpasswd \
    && usermod -aG sudo ${username} \
    && mkdir -p /workspace && chown ${username} /workspace

WORKDIR /workspace
USER ${username}
CMD /bin/bash