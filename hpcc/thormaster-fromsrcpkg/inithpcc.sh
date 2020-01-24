#!/bin/bash

imagename=$1
cmd=$2

cp /data/environment.xml /etc/HPCCSystems/environment.xml
cp /data/environment.xml /etc/HPCCSystems/source/environment.xml

mkdir -p /data/logs/${imagename}
mkdir -p /data/hpcc-data/${imagename}
mkdir -p /data/hpcc-mirror/${imagename}
if [ -d /var/log/HPCCSystems ]; then
  rm -rf /var/log/HPCCSystems
fi
ln -s /data/logs/${imagename} /var/log/HPCCSystems
chmod og-w /var/log/HPCCSystems
ln -s /data/hpcc-data/${imagename} /var/lib/HPCCSystems/hpcc-data
ln -s /data/hpcc-mirror/${imagename} /var/lib/HPCCSystems/hpcc-mirror

/etc/init.d/ssh start
/etc/init.d/hpcc-init start

shutdown()
{
  /etc/init.d/hpcc-init stop
  /etc/init.d/dafilesrv stop
}

if [ ! -z "${cmd}" ]; then
 echo "Running ${cmd}"
 exec sudo -H -u build ${cmd}
else
 trap shutdown SIGINT SIGTERM
 echo "Waiting for shutdown"
 sleep infinity &
 wait
fi

