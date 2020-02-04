FROM jcs/hpcc-baseimage

EXPOSE 20100

COPY --chown=build:build init.sh .
USER root
WORKDIR /home/build
ENTRYPOINT ["./init.sh"]
