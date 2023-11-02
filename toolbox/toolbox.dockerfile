FROM ubuntu:22.04

RUN apt-get update && \
	apt-get install -qq build-essential software-properties-common moreutils && \
	apt-get install -qq vim git jq && \
	apt-get install -qq tree psmisc && \
	apt-get install -qq net-tools wget curl socat tcpdump telnet && \
	apt-get install -qq htop sysstat && \
	apt-get install -qq linux-tools-common linux-tools-generic linux-tools-`uname -r` && \
	apt-get install -qq trace-cmd strace bpftrace
