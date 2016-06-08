############################################################
# Dockerfile for Smart DNS Containers
# Based on Ubuntu
# Author: Zhipeng Jiang <zhipj@microsoft.com>
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Zhipeng Jiang

# Add the application resources URL
RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial main universe" >> /etc/apt/sources.list

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl vim wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip

######
# DNS
######

RUN git clone https://github.com/zp-j/smart_dns.git && cd smart_dns
RUN pip install -r pkg.txt
RUN cd script && ./run_dns.sh
