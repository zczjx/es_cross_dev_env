# es cross dev env
embedded system Ubuntu cross build env with Docker

Build flow

1. download the pre toolchain and pkgs

    $ ./docker_pre_download.sh

2. build the docker image with the toolchain arch you need

    $ ./docker_build.sh [arm | armv8l | aarch64]

3. run the docker with the toolchain arch you need and select the correct dir in your host with absolute path

    $ ./docker_run.sh [arm | armv8l | aarch64] [workspace path exam: /home/clarencez/workspace] [3rd-pkg path exam: /home/clarencez/3rd-pkg]
