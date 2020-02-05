#!/bin/bash

cd ~build/buildctx
mkdir -p cmake
cd cmake
rm -f *.deb
cmake -DRUNTIME_USER=build -DDESTDIR=$(realpath ~build)/hpccinstall -D ECLWATCH_BUILD_STRATEGY="IF_MISSING" -D USE_CPPUNIT=On -D CMAKE_BUILD_TYPE=Debug -D USE_LIBMEMCACHED=Off ../HPCC-Platform
numcores=$(grep -c ^processor /proc/cpuinfo)
let "numthreads = $numcores * 3 / 4"

echo make -j ${numthreads} install
make -j ${numthreads} install
