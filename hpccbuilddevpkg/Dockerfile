FROM ubuntu:18.04 as hpccbuilddevpkg

ENV DEBIAN_FRONTEND=noninteractive

# hpcc build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  automake \
  autotools-dev \
  binutils-dev \
  bison \
  build-essential \
  cmake \
  default-jdk \
  default-libmysqlclient-dev \
  flex \
  libapr1-dev \
  libaprutil1-dev \
  libarchive-dev \
  libatlas-base-dev \
  libblas-dev \
  libboost-regex-dev \
  libcppunit-dev \
  libcurl4-openssl-dev \
  libevent-dev \
  libhiredis-dev \
  libiberty-dev \
  libicu-dev \
  libldap2-dev \
  libmemcached-dev \
  libnuma-dev \
  libsqlite3-dev \
  libssl-dev \
  libtbb-dev \
  libtool \
  libv8-dev \
  libxalan-c-dev \
  libxslt1-dev \
  nodejs \
  pkg-config \
  python-dev \
  python3-dev \
  r-base-dev \
  r-cran-inline \
  r-cran-rcpp \
  r-cran-rinside \
  sudo \
  zlib1g-dev

RUN apt-get install -y --no-install-recommends \
  git \
  wget \
  curl \
  apt-utils

RUN apt-get install -y --no-install-recommends \
  xterm \
  openssh-client \
  openssh-server \
  expect \
  rsync \
  psmisc


# need new version of cmake
RUN wget -qO- "https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN sudo apt-get install -y nodejs

RUN useradd -ms /bin/bash -G sudo build && echo "build:build" | chpasswd

USER build
WORKDIR /home/build

# HPCC specific stuff
RUN echo "Copying /home/jsmith/dev/git/HPCC-Platform"
COPY --chown=build:build HPCC-Platform /home/build/HPCC-Platform

RUN mkdir cmake && cd cmake && cmake -D ECLWATCH_BUILD_STRATEGY="IF_MISSING" -D USE_CPPUNIT=On -D CMAKE_BUILD_TYPE=Debug -D USE_LIBMEMCACHED=Off $* ../HPCC-Platform
RUN cd cmake && make -j 12 package
