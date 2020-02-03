FROM jcs/hpcc-baseimage

EXPOSE 20000

ENV DALIHOST="hpcc-dali"
ENV THORMASTERHOST="hpcc-thormaster"

COPY envtr.xslt scripts/xslt/

RUN xmlstarlet tr /scripts/xslt/envtr.xslt $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml \
    | sed -e "s/DALIHOST/${DALIHOST}/g" > tmp.xml
RUN mv tmp.xml $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml

ENV instname=mythor

SHELL ["/bin/bash", "-c"]

RUN source ${HPCC_INSTALL_BASE}/opt/HPCCSystems/sbin/hpcc_setenv

RUN source ${HPCC_INSTALL_BASE}/opt/HPCCSystems/etc/init.d/hpcc_common

#RUN source $HPCC_INSTALL_BASE/var/lib/HPCCSystems/${instname}/setvars

COPY initthor.sh /scripts/init/
#CMD ["/scripts/init/start-hpcccomp.sh", "thormaster_lcr", "mythor"]
#CMD ["/scripts/init/start-hpcccomp.sh", "/bin/bash", "mythor"]
CMD ["/scripts/init/initthor.sh", "mythor"]
