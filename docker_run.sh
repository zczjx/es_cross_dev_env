#!/bin/bash
username=git
docker run -it \
-v /dev:/dev \
-v /home/${USER}/github/nfs/:/workspace \
-v /home/${USER}/github/es_cross_dev_env/3rd-pkg:/home/${username}/3rd-pkg \
--privileged arm_linux_env:18.04
