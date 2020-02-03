FROM jcs/hpcc-baseimage

EXPOSE 8010

ENV DALIHOST="hpcc-dali"

COPY envtr.xslt scripts/xslt/

RUN xmlstarlet tr /scripts/xslt/envtr.xslt $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml \
    | sed -e "s/DALIHOST/${DALIHOST}/g" > tmp.xml
RUN mv tmp.xml $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml

# "myeclagent" because dealing with generic environment
CMD ["/scripts/init/start-hpcccomp.sh", "agentexec", "myeclagent"]
