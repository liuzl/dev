FROM ubuntu:16.04

ENV LANG=en_US.UTF-8

RUN apt-get update -y

RUN apt-get -y install gcc \
	g++ \
	gdb \
	automake \
	autoconf \
	libtool \
	make \
	cmake

RUN apt-get -y install ssh \
	ntp \
	vim \
	wget \
	curl \
	telnet

RUN apt-get -y install git \
	subversion \
	doxygen \
	lighttpd \
	net-tools \
	inetutils-ping

RUN apt-get -y install python \
	golang

RUN apt-get -y install libbz2-dev \
	libdb++-dev \
	libssl-dev \
	libdb-dev \
	libssl-dev \
	openssl \
	libreadline-dev \
	libcurl4-openssl-dev \
	libncurses-dev \
	autotools-dev \
	build-essential \
	libicu-dev \
	python-dev

RUN mkdir /var/run/sshd

# change sshd listen port
RUN sed -i 's/Port[ ]*22/Port 36000/' /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# add user
RUN mkdir /home/zliu
RUN useradd -s /bin/bash zliu
RUN echo "zliu:123456" | chpasswd
RUN echo "zliu:123456" | chpasswd
RUN chown -R zliu:zliu /home/zliu

# Container should expose ports.
EXPOSE 36000
CMD ["/usr/sbin/sshd", "-D"]
