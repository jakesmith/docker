#!/bin/bash

./commoninit.sh

exec sudo -i -u build << EOF
  exec ${HPCC_INSTALL_BASE}/opt/HPCCSystems/bin/thormaster_lcr $@
EOF
