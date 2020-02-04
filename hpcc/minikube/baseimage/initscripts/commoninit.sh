#!/bin/bash

/etc/init.d/ssh start

chown -R build:build /data
sudo -E -u build ./setupdisks.sh $HOSTNAME
sudo -E -u build ~/hpccinstall/opt/HPCCSystems/bin/dafilesrv &

