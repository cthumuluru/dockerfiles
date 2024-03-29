#!/bin/bash

alias nvim-build="docker build --network=host -t neovim . -f nvim-dockerfile"
alias nvim-stop="docker container rm -f nvim-dev"
alias nvim-start="docker run -d --name=nvim-dev --network=host -it -v /workspace:/workspace neovim sleep infinity"
alias nvim-attach="docker exec -it nvim-dev /bin/bash"

alias pg-dev-build="docker build --network=host -t pg-dev . -f nvim-pg-dockerfile"
alias pg-dev-stop="docker container rm -f pg-dev"
alias pg-dev-start="docker run -d -it --network=host --name=pg-dev pg-dev sleep infinity"
alias pg-dev-attach="docker exec -it pg-dev nvim /root/git_ws/postgres"

alias odyssey-dev-build="docker build --network=host -t odyssey-dev . -f nvim-odyssey-dockerfile"
alias odyssey-dev-stop="docker container rm -f odyssey-dev"
alias odyssey-dev-start="docker run -d -it --network=host --name=odyssey-dev odyssey-dev sleep infinity"
alias odyssey-dev-attach="docker exec -it odyssey-dev nvim /root/git_ws/odyssey"

alias pgbouncer-dev-build="docker build --network=host -t pgbouncer-dev . -f nvim-pgbouncer-dockerfile"
alias pgbouncer-dev-stop="docker container rm -f pgbouncer-dev"
alias pgbouncer-dev-start="docker run -d -it --network=host --name=pgbouncer-dev pgbouncer-dev sleep infinity"
alias pgbouncer-dev-attach="docker exec -it pgbouncer-dev nvim /root/git_ws/pgbouncer"
