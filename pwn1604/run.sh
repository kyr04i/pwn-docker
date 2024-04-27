#!/bin/bash

check_name=`docker ps -a | grep ctf1604`

if [[ -z $check_name ]]; then
    sudo docker run -v $(pwd):/ctf --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --privileged --entrypoint /bin/bash -it --rm --name=ctf1604 ctf:16.04 
else
    sudo docker exec -it ctf1804 /bin/tmux
fi