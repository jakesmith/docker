#!/bin/bash

imagename=$1

mkdir -p /data/logs/${imagename}
mkdir -p /data/hpcc-data/${imagename}
mkdir -p /data/hpcc-mirror/${imagename}
rm -rf ~/hpccinstall/var/log/HPCCSystems
rm -rf ~/hpccinstall/var/lib/HPCCSystems/hpcc-data
rm -rf ~/hpccinstall/var/lib/HPCCSystems/hpcc-mirror
ln -snf /data/logs/${imagename} ~/hpccinstall/var/log/HPCCSystems
ln -snf /data/hpcc-data/${imagename} ~/hpccinstall/var/lib/HPCCSystems/hpcc-data
ln -snf /data/hpcc-mirror/${imagename} ~/hpccinstall/var/lib/HPCCSystems/hpcc-mirror
