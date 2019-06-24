#!/bin/bash

cp /data/environment.xml /etc/HPCCSystems/environment.xml
cp /data/environment.xml /etc/HPCCSystems/source/environment.xml

mkdir -p /data/logs
mkdir -p /data/hpcc-data
mkdir -p /data/hpcc-mirror
chown hpcc:hpcc /data/logs
chown hpcc:hpcc /data/hpcc-data
chown hpcc:hpcc /data/hpcc-mirror
if [ -d /var/log/HPCCSystems ]; then
  rm -rf /var/log/HPCCSystems
fi
ln -s /data/logs /var/log/HPCCSystems
chmod og-w /var/log/HPCCSystems
ln -s /data/hpcc-data /var/lib/HPCCSystems/hpcc-data
ln -s /data/hpcc-mirror /var/lib/HPCCSystems/hpcc-mirror

/etc/init.d/ssh start
/etc/init.d/hpcc-init start

shutdown()
{
  /etc/init.d/hpcc-init stop
  /etc/init.d/dafilesrv stop
}

if [ ! -z "$@" ]; then
 echo "Running $@"
 exec sudo -H -u build $@
else
 trap shutdown SIGINT SIGTERM
 echo "Waiting for shutdown"
 sleep infinity &
 wait
fi

