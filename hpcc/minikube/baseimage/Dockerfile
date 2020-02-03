FROM jcs/hpccbuild-install

USER root

RUN apt-get install -y --no-install-recommends xmlstarlet
RUN apt-get install -y --no-install-recommends gdb


# currently baseinit.sh start sshd whilst in development
EXPOSE 22

COPY initscripts scripts/init/

RUN mkdir -p /data
RUN chown build:build /data

# all this does is startup ssh service (as a temporary debugging aid)
# and then fire up what CMD's have been passed through
ENTRYPOINT ["/scripts/init/baseinit.sh"]
CMD ["/bin/bash"]
