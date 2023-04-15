#!/bin/bash

alias notebook-build="docker build -t notebook:v1 -f notebook.dockerfile ."
alias notebook-start="docker run -d -it --name notebook -v/workspace/data/notebook:/data:rw --network=host notebook:v1"
alias notebook-stop="docker container rm -f notebook"
alias notebook-list="docker exec -it notebook jupyter notebook list"
