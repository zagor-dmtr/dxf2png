FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install g++ gcc make git-core qtbase5-dev libqt5svg5-dev \
 qttools5-dev qtchooser qttools5-dev-tools libmuparser-dev librsvg2-bin \
 libboost-dev libfreetype6-dev libicu-dev pkg-config 
RUN apt-get -y install qt5-default xvfb wget unzip enca

COPY . /work
WORKDIR /work
RUN ./clean.sh && qmake -r && make -j 4 && cp -rf unix /dxf2png && ./clean.sh
