#!/bin/bash

./commoninit.sh

exec sudo -i -u build << EOF
  export PATH=${PATH}:${HPCC_INSTALL_BASE}/opt/HPCCSystems/bin
  exec ${HPCC_INSTALL_BASE}/opt/HPCCSystems/bin/agentexec $@
EOF
