FROM ubuntu:14.04
MAINTAINER Leonid Rashkovsky "leonid.r@fiverr.com"

# turn on universe packages
#RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y libc-dev libgcc-4.8-dev gcc-4.8 g++ gawk make libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev
RUN apt-get install -y git-core curl

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"

RUN /bin/bash -l -c "rvm install ruby-2.2.2"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
