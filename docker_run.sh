#!/bin/bash
username=git
docker run -it \
-v /dev:/dev \
-v /home/zcz/github/nfs/:/workspace \
-v /home/zcz/github/es_cross_dev_env/3rd-pkg:/home/${username}/3rd-pkg \
--privileged arm_linux_env:18.04
