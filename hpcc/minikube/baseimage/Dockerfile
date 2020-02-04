FROM jcs/hpccbuild-install

USER root

RUN apt-get install -y --no-install-recommends xmlstarlet
RUN apt-get install -y --no-install-recommends gdb

# currently baseinit.sh start sshd whilst in development
EXPOSE 22


RUN mkdir -p /data
RUN chown build:build /data

USER build
WORKDIR /home/build

COPY --chown=build:build initscripts .

ENTRYPOINT ["/bin/bash"]
