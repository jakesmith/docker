#!/bin/bash

imagename=$1
cmd=$2

cp /data/environment.xml /home/build/hpccdeb/etc/HPCCSystems/environment.xml
##cp /data/environment.xml /home/build/hpccdeb/etc/HPCCSystems/source/environment.xml

ln -s /data/logs/${imagename} /home/build/hpccdeb/var/log/HPCCSystems
ln -s /data/hpcc-data/${imagename} /home/build/hpccdeb/var/lib/HPCCSystems/hpcc-data
ln -s /data/hpcc-mirror/${imagename} /home/build/hpccdeb/var/lib/HPCCSystems/hpcc-mirror

#/home/build/hpccdeb/etc/init.d/hpcc-init start
/home/build/hpccdeb/etc/init.d/dafilesrv start

shutdown()
{
  /home/build/hpccdeb/etc/init.d/hpcc-init stop
  /home/build/hpccdeb/etc/init.d/dafilesrv stop
}

if [ ! -z "${cmd}" ]; then
 echo "Running ${cmd}"
 exec ${cmd}
else
 trap shutdown SIGINT SIGTERM
 echo "Waiting for shutdown"
 sleep infinity &
 wait
fi

