#!/bin/bash

alias nvim-build="docker build --network=host -t neovim . -f nvim-dockerfile"
alias nvim-stop="docker container rm -f nvim-dev"
alias nvim-start="docker run --name=nvim-dev --network=host -it neovim /bin/bash"

alias pg-dev-build="docker build --network=host -t pg-dev . -f nvim-pg-dockerfile"
alias pg-dev-stop="docker container rm -f pg-dev"
alias pg-dev-start="docker run -d -it --network=host --name=pg-dev pg-dev sleep infinity"
alias pg-dev-attach="docker exec -it pg-dev /bin/bash"

alias odyssey-dev-build="docker build --network=host -t odyssey-dev . -f nvim-odyssey-dockerfile"
alias odyssey-dev-stop="docker container rm -f odyssey-dev"
alias odyssey-dev-start="docker run -d -it --network=host --name=odyssey-dev odyssey-dev sleep infinity"
alias odyssey-dev-attach="docker exec -it odyssey-dev /bin/bash"
