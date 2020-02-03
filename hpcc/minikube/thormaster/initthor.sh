#!/bin/bash

instname=$1
$HPCC_INSTALL_BASE/opt/HPCCSystems/sbin/configgen -env $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml -c ${instname}
cd $HPCC_INSTALL_BASE/var/lib/HPCCSystems/${instname}
exec ${HPCC_INSTALL_BASE}/opt/HPCCSystems/bin/thormaster_lcr ${@:2}
#exec /bin/bash

