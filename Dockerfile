FROM ubuntu:18.04
MAINTAINER siong@flochip.com

# Install all the dependencies
RUN apt-get update -q
RUN apt-get upgrade -y
RUN apt-get install python rename git software-properties-common libzmq3-dev libqrencode-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev -y

# Install all bitcoin dependencies
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install libdb4.8-dev libdb4.8++-dev vim -y

# Use vim as the default editor.
ENV EDITOR vi

# Make /app our working directory.
RUN mkdir -p /app
WORKDIR /app