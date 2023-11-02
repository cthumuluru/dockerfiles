FROM ubuntu:22.04

RUN apt-get update && \
	apt-get install -qq -y build-essential software-properties-common && \
	apt-get install -qq -y python3-pip && \
	apt-get install lua5.4 && \
	pip install notebook 

# install kernels
RUN pip install ilua bash_kernel jupyter-c-kernel && \
  python3 -m bash_kernel.install && \
  install_c_kernel --user

RUN useradd -U notebook -m
RUN mkdir /data && \
	chown -R notebook /data && \
	chgrp -R notebook /data
USER notebook

VOLUME /data
EXPOSE 11211/tcp

ENTRYPOINT ["jupyter", "notebook", "--notebook-dir", "/data", "--port", "11211"]
