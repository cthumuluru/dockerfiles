#!/bin/bash

alias toolbox-build="docker build -t toolbox:v1 -f toolbox.dockerfile ."
alias toolbox-start="docker run --name=toolbox -d -it --pid=host --privileged --network=host -v /sys/kernel/debug:/sys/kernel/debug toolbox:v1 sleep infinity"
alias toolbox-stop="docker container rm -f toolbox"
alias toolbox="docker exec -it toolbox /bin/bash"
