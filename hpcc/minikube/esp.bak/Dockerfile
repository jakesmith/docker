FROM jcs/hpcc-baseimage

EXPOSE 8010

ENV DALIHOST="hpcc-dali"
ENV ESPHOST="hpcc-esp"
RUN cat $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml \
    | xmlstarlet ed -u "/Environment/Software/DaliServerProcess/Instance/@netAddress" -v $DALIHOST \
    | xmlstarlet ed -u "/Environment/Hardware/Computer/@netAddress" -v $DALIHOST \
    | xmlstarlet ed -u "/Environment/Software/EspProcess/Instance/@netAddress" -v $ESPHOST\
    | xmlstarlet ed -u '/Environment/Software/DropZone/ServerList[@server="PLACEHOLDER"]/@server' -v $ESPHOST \
    | xmlstarlet ed -u '//*[@netAddress="PLACEHOLDER"]/@netAddress' -v $ESPHOST \
    > tmp.xml
RUN mv tmp.xml $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml

# "myesp" because dealing with generic environment
CMD ["/scripts/init/start-hpcccomp.sh", "esp", "myesp"]
