FROM jcs/hpcc-baseimage

EXPOSE 20000

SHELL ["/bin/bash", "-c"]

##RUN source ${HPCC_INSTALL_BASE}/opt/HPCCSystems/sbin/hpcc_setenv

#RUN source ${HPCC_INSTALL_BASE}/opt/HPCCSystems/etc/init.d/hpcc_common

COPY --chown=build:build thor.xml .
COPY --chown=build:build init.sh .
USER root
WORKDIR /home/build
ENTRYPOINT ["./init.sh"]
