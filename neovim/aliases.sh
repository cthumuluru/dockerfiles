#!/bin/bash

alias nvim-build="docker build -t neovim . -f nvim-dockerfile"
alias nvim-stop="docker container rm -f nvim-dev"
alias nvim-start="docker run --name=nvim-dev -it neovim /bin/bash"

alias pg-dev-build="docker build -t pg-dev . -f nvim-pg-dockerfile"
alias pg-dev-stop="docker container rm -f pg-dev"
alias pg-dev-start="docker run -it --name=pg-dev pg-dev /bin/bash"
