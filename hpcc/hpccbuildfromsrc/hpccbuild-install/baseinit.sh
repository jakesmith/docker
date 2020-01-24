#!/bin/bash

/etc/init.d/ssh start

sudo -E -u build /scripts/init/setupdisks.sh $HOSTNAME

exec sudo -E -u build $@
