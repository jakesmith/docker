#!/bin/bash

/scripts/init/commoninit.sh

instname=mythor
sudo -i -u build << EOF
  $HPCC_INSTALL_BASE/opt/HPCCSystems/sbin/configgen -env $HPCC_INSTALL_BASE/etc/HPCCSystems/environment.xml -c ${instname}
  cd $HPCC_INSTALL_BASE/var/lib/HPCCSystems/${instname}
  exec ${HPCC_INSTALL_BASE}/opt/HPCCSystems/bin/thormaster_lcr "$@"
EOF
