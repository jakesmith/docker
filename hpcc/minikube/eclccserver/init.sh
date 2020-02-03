#!/bin/bash

/etc/init.d/ssh start

chown -R build:build /data
sudo -E -u build /scripts/init/setupdisks.sh $HOSTNAME

echo " HELLO ===== "
echo sudo -E -u build $@
cmdline="sudo -E -u build $@"
echo cmdline is ${cmdline}
exec sudo -E -u build /bin/bash -c "(~/hpccinstall/opt/HPCCSystems/bin/dafilesrv) & (/scripts/init/start-hpcccomp.sh eclccserver myeclccserver) && wait"
