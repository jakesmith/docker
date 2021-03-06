#!/bin/bash

cmd=$1
instname=$2
$HPCC_INSTALL_BASE/opt/HPCCSystems/sbin/configgen -env $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml -c ${instname}
cd $HPCC_INSTALL_BASE/var/lib/HPCCSystems/${instname}
source $HPCC_INSTALL_BASE/opt/HPCCSystems/sbin/hpcc_setenv
exec ${HPCC_INSTALL_BASE}/opt/HPCCSystems/bin/${cmd} ${@:3}
