FROM jcs/hpccbuilddev:latest

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get install -y --no-install-recommends \
  vim \
  iputils-ping \
  net-tools

# JCSMORE - should have differnt images for slave/master, don't need port on master
EXPOSE 22
EXPOSE 8010 20000 20100

COPY inithpcc.sh /usr/local/bin/
COPY inithpccashpcc.sh /usr/local/bin/
RUN ln -s usr/local/bin/inithpcc.sh / # backwards compat
ENTRYPOINT ["/bin/bash", "-c", "inithpcc.sh \"$@\"", "--"]
