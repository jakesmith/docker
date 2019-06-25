#!/bin/bash

if [ $# -lt 3 ]; then
  echo Usage: createenv ENVFILEOUT THORNAME NUMSLAVES
  exit 1
fi

# not using at moment
nextip()
{
    IP=$1
    IP_HEX=$(printf '%.2X%.2X%.2X%.2X\n' `echo $IP | sed -e 's/\./ /g'`)
    NEXT_IP_HEX=$(printf %.8X `echo $(( 0x$IP_HEX + 1 ))`)
    NEXT_IP=$(printf '%d.%d.%d.%d\n' `echo $NEXT_IP_HEX | sed -r 's/(..)/0x\1 /g'`)
    echo "$NEXT_IP"
}

envFileOut=$1
thorName=$2
numSlaves=$3
scriptdir=$(realpath $(dirname $0))

middlewareHostname="${thorName}_thormaster"
sed -e "s/middlewareComputerName/${middlewareHostname}/g" -e "s/middlewareHostName/${middlewareHostname}/g" ${scriptdir}/e1.xml > ${envFileOut}


cat >> ${envFileOut} <<_EOF
  <Computer computerType="linuxmachine"
            domain="localdomain"
            name="${thorName}_thormaster"
            netAddress="${thorName}_thormaster"/>
_EOF

# <Computer>'s
for slave in $(seq 1 ${numSlaves}); do
  name="${thorName}_thorslave${slave}"
  cat >> ${envFileOut} <<_EOF
  <Computer computerType="linuxmachine"
            domain="localdomain"
            name="${name}"
            netAddress="${name}"/>
_EOF
done

sed -e "s/middlewareComputerName/${middlewareHostname}/g" -e "s/middlewareHostName/${middlewareHostname}/g" ${scriptdir}/e2.xml >> ${envFileOut}

# <FTSlaveProcess>'s
for slave in $(seq 1 ${numSlaves}); do
  name="${thorName}_thorslave${slave}"
  cat >> ${envFileOut} <<_EOF
   <Instance computer="${name}"
             directory="/var/lib/HPCCSystems/myftslave"
             name="${name}"
             netAddress="${name}"
             program="/opt/HPCCSystems/bin/ftslave"/>
_EOF
done

sed -e "s/middlewareComputerName/${middlewareHostname}/g" -e "s/middlewareHostName/${middlewareHostname}/g" ${scriptdir}/e3.xml >> ${envFileOut}

# <DafilesrvProcess>'s
for slave in $(seq 1 ${numSlaves}); do
  name="${thorName}_thorslave${slave}"
  cat >> ${envFileOut} <<_EOF
   <Instance computer="${name}"
             directory="/var/lib/HPCCSystems/mydafilesrv"
             name="${name}"
             netAddress="${name}"
             parallelRequestLimit="20"
             throttleCPULimit="75"
             throttleDelayMs="5000"/>
_EOF
done

sed -e "s/middlewareComputerName/${middlewareHostname}/g" -e "s/middlewareHostName/${middlewareHostname}/g" ${scriptdir}/e4.xml >> ${envFileOut}

# <ThorSlaveProcess>'s
for slave in $(seq 1 ${numSlaves}); do
  name="${thorName}_thorslave${slave}"
  cat >> ${envFileOut} <<_EOF
   <ThorSlaveProcess computer="${name}" name="${name}"/>
_EOF
done

sed -e "s/middlewareComputerName/${middlewareHostname}/g" -e "s/middlewareHostName/${middlewareHostname}/g" ${scriptdir}/e5.xml >> ${envFileOut}

