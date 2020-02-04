FROM jcs/hpcc-baseimage

EXPOSE 20000
EXPOSE 22

ENV DALIHOST="hpcc-dali"
ENV ESPHOST="hpcc-esp"
ENV THORMASTERHOST="hpcc-thormaster"

COPY envtr.xslt scripts/xslt/

RUN xmlstarlet tr /scripts/xslt/envtr.xslt $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml \
    | sed -e "s/DALIHOST/${DALIHOST}/g" | sed -e "s/ESPHOST/${ESPHOST}/g" > tmp.xml
RUN mv tmp.xml $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml

ENV instname=mythor

SHELL ["/bin/bash", "-c"]

RUN source ${HPCC_INSTALL_BASE}/opt/HPCCSystems/sbin/hpcc_setenv

RUN source ${HPCC_INSTALL_BASE}/opt/HPCCSystems/etc/init.d/hpcc_common

#RUN source $HPCC_INSTALL_BASE/var/lib/HPCCSystems/${instname}/setvars

COPY initthor.sh /scripts/init/
ENTRYPOINT ["/scripts/init/initthor.sh"]
