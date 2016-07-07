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
RUN echo "deb http://archive.ubuntu.com/ubuntu/ xenial main universe" >> /etc/apt/sources.list

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y git build-essential htop

# Install dev tolls
# RUN apt-get install -y dnsutils tar curl vim wget dialog net-tools

# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip

######
# DNS
######

ADD . /smartdns
WORKDIR /smartdns/script
RUN pip install Twisted==12.2.0
RUN pip install requests
RUN mkdir /smartdns/log
CMD ./run_dns.sh && tail -f /smartdns/log/access_dns.log
