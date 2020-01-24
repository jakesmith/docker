FROM jcs/hpccbuildsrcwithpackage:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y --no-install-recommends \
  vim \
  iputils-ping \
  net-tools

# JCSMORE - should have differnt images for slave/master, don't need port on master
EXPOSE 22
EXPOSE 8010 20000 20100 7100 7601

COPY inithpcc.sh /usr/local/bin/
RUN ln -s usr/local/bin/inithpcc.sh / # backwards compat
ENTRYPOINT ["/bin/bash", "-c", "inithpcc.sh \"$@\"", "--"]
