#!/bin/bash

imagename=$1
cmd=$2

/etc/init.d/ssh start

mkdir -p /data/logs/${imagename}
chown -R build:build /data/logs/${imagename}
mkdir -p /data/hpcc-data/${imagename}
chown -R build:build /data/hpcc-data/${imagename}
mkdir -p /data/hpcc-mirror/${imagename}
chown -R build:build /data/hpcc-mirror/${imagename}
if [ -d /home/build/hpccdeb/var/log/HPCCSystems ]; then
  rm -rf /home/build/hpccdeb/var/log/HPCCSystems
fi

exec sudo -H -u build /usr/local/bin/inithpccashpcc.sh ${imagename} ${cmd}
