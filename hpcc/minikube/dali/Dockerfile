FROM jcs/hpcc-baseimage

EXPOSE 7070

RUN cat $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml \
    | xmlstarlet ed -s "/Environment/Software/DaliServerProcess" -t elem -n "WhiteList" \
    | xmlstarlet ed -s "/Environment/Software/DaliServerProcess/WhiteList" -t attr -n "enabled" -v "false" \
    > tmp.xml
RUN mv tmp.xml $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml

COPY --chown=build:build daliconf.xml .
COPY --chown=build:build init.sh .
USER root
WORKDIR /home/build
ENTRYPOINT ["./init.sh"]
