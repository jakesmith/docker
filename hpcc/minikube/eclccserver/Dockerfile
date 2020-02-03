FROM jcs/hpcc-baseimage

ENV DALIHOST="hpcc-dali"
ENV ESPHOST="hpcc-esp"

COPY envtr.xslt scripts/xslt/

RUN xmlstarlet tr /scripts/xslt/envtr.xslt $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml \
    | sed -e "s/DALIHOST/${DALIHOST}/g" | sed -e "s/ESPHOST/${ESPHOST}/g" > tmp.xml
RUN mv tmp.xml $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml

# "myeclccserver" because dealing with generic environment
#CMD ["/bin/bash", "-c", "\"(/scripts/init/start-hpcccomp.sh eclccserver myeclccserver)\""]
#CMD ["/bin/bash", "-c", "(~/hpccinstall/opt/HPCCSystems/bin/dafilesrv) & (/scripts/init/start-hpcccomp.sh eclccserver myeclccserver) && wait"]
#CMD ["/bin/bash", "-c", "(/scripts/init/start-hpcccomp.sh dafilesrv mydafilesrv)"]
#CMD ["bash", "-c", "(/scripts/init/start-hpcccomp.sh dafilesrv mydafilesrv) & (/scripts/init/start-hpcccomp.sh eclccserver myeclccserver) && wait"]

#CMD ["/scripts/init/start-hpcccomp.sh", "eclccserver", "myeclccserver"]
COPY init.sh /scripts/init/
#CMD ["/scripts/init/init.sh", "myeclccserver"]
ENTRYPOINT ["/scripts/init/init.sh"]
