### Dockerize Velveth - 1.2.10

## use the dockerfile/python base image, which provide all the needed libs.
FROM dockerfile/python

MAINTAINER David Weng weng@email.arizona.edu

## update and apt repos, install the necessary tools to compile the libs.
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y gcc
RUN apt-get install -y make

## Get the zlib lib.
# Back to the /home/vagrant/ directory
WORKDIR /home/vagrant
RUN wget http://zlib.net/zlib-1.2.8.tar.gz
RUN tar xzvf zlib-1.2.8.tar.gz
WORKDIR zlib-1.2.8
RUN sudo ./configure
# Still in /zlib-1.2.8 directory
RUN make
RUN sudo make install 

## make sure in the working directory.
WORKDIR /home/vagrant 
## download and make the tool
RUN wget http://www.ebi.ac.uk/~zerbino/velvet/velvet_1.2.10.tgz
RUN tar zxvf velvet_1.2.10.tgz
WORKDIR velvet_1.2.10
RUN make

