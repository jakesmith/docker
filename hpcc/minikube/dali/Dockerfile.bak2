FROM jcs/hpcc-baseimage

EXPOSE 7070

ENV DALIHOST="hpcc-dali"
RUN cat $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml \
    | xmlstarlet ed -u "/Environment/Software/DaliServerProcess/Instance/@netAddress" -v $DALIHOST \
    | xmlstarlet ed -u "/Environment/Hardware/Computer/@netAddress" -v $DALIHOST \
    | xmlstarlet ed -s "/Environment/Software/DaliServerProcess" -t elem -n "WhiteList" \
    | xmlstarlet ed -s "/Environment/Software/DaliServerProcess/WhiteList" -t attr -n "enabled" -v "false" \
    | xmlstarlet ed -u '/Environment/Software/DropZone/ServerList[@server="PLACEHOLDER"]/@server' -v $DALIHOST \
    | xmlstarlet ed -u '//*[@netAddress="PLACEHOLDER"]/@netAddress' -v $DALIHOST \
    > tmp.xml
RUN mv tmp.xml $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml

# "mydali" because dealing with generic environment
CMD ["/scripts/init/start-hpcccomp.sh", "daserver", "mydali"]
