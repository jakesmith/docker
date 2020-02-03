#!/bin/bash

/etc/init.d/ssh start

chown -R build:build /data
sudo -E -u build /scripts/init/setupdisks.sh $HOSTNAME

exec sudo -E -u build $@
