FROM jcs/hpcc-baseimage

EXPOSE 8010

COPY --chown=build:build esp.xml .
COPY --chown=build:build init.sh .
USER root
WORKDIR /home/build
ENTRYPOINT ["./init.sh"]
