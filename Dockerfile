# Scala for Ubuntu 12.04 LTS
#
# Version     0.1

FROM ubuntu:precise
MAINTAINER Łukasz Budnik lukasz.budnik@gmail.com

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# install add-apt-repository tool
RUN apt-get install -y python-software-properties

# Java 7 apt repository
RUN add-apt-repository ppa:webupd8team/java

# update apt repositories
RUN apt-get update

# install Scala, requires OpenJDK 1.6
RUN apt-get install -y wget
RUN apt-get install -y openjdk-6-jre libjansi-java
RUN wget http://www.scala-lang.org/files/archive/scala-2.10.3.deb 
RUN dpkg -i scala-2.10.3.deb
RUN rm -f scala-2.10.3.deb

# upgrade Java to latest 1.7.x
RUN echo 'debconf shared/accepted-oracle-license-v1-1 select true' | debconf-set-selections
RUN apt-get install -y oracle-java7-installer
