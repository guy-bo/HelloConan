FROM jenkins/jenkins:latest

USER root
# Upgrade installed packages
RUN apt-get update -y
RUN apt-get install -y software-properties-common
#RUN apt-add-repository universe
RUN apt-get update -y && apt-get upgrade -y

# Python package management and basic dependencies
RUN apt-get install -y -qq curl python3.7 python3.7-dev python3.7-distutils python-pip

# Register the version in alternatives
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1

# Set python 3 as the default python
RUN update-alternatives --set python /usr/bin/python3.7

RUN mkdir /home/HelloConan
RUN apt-get update && apt-get install -y make cmake build-essential
ENV CXX=/usr/bin/g++
USER jenkins
