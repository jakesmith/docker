FROM jcs/hpcc-baseimage

COPY --chown=build:build eclccserver.xml .
COPY --chown=build:build init.sh .
USER root
WORKDIR /home/build
ENTRYPOINT ["./init.sh"]
