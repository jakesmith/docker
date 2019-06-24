FROM jcs/hpccbuild:latest

ENV DEBIAN_FRONTEND=noninteractive

USER build
WORKDIR /home/build
RUN mkdir cmake-cdt && cd cmake-cdt && cmake ../HPCC-Platform && make -j 12 package

WORKDIR /home/build/cmake-cdt
USER root

RUN dpkg -i `ls *.deb`

# JCSMORE - should have differnt images for slave/master, don't need port on master
EXPOSE 22
EXPOSE 8010 20000 20100

COPY inithpcc.sh /usr/local/bin/
RUN ln -s usr/local/bin/inithpcc.sh / # backwards compat
ENTRYPOINT ["/bin/bash", "-c", "inithpcc.sh \"$@\"", "--"]
