# Scala, Java, and sbt for Ubuntu 12.04 LTS
#
# Version     0.4

FROM ubuntu:xenial
MAINTAINER Łukasz Budnik lukasz.budnik@gmail.com

RUN echo "deb http://archive.ubuntu.com/ubuntu xenial main universe\n\
    deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list

# import webupd8team public key
RUN gpg --keyserver keyserver.ubuntu.com --recv-key C2518248EEA14886 ; \
    gpg --armor --export C2518248EEA14886 | apt-key add -

# upgrade Java to latest 1.8.x
RUN echo 'debconf shared/accepted-oracle-license-v1-1 select true' | debconf-set-selections ; \
    apt-get update \
    && apt-get install -y oracle-java8-set-default

# install sbt version 1.2.1
RUN wget -O sbt.deb http://dl.bintray.com/sbt/debian/sbt-1.2.1.deb \
    && dpkg -i sbt.deb \
    && rm -f sbt.deb

# print versions
RUN java -version

# fetches all sbt jars from Maven repo so that your sbt will be ready to be used when you launch the image
RUN sbt about
