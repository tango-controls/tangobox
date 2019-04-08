#!/usr/bin/env bash

set -x
set -e

TANGOBOX_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"
TANGOBOX_VM_DIR="$TANGOBOX_DIR/vm"
TANGOBOX_BUILD_DIR="$TANGOBOX_DIR/build"
TANGOBOX_DB_DIR=~/work/tangobox/db # installed by prepare-tree.sh

# specify version
TANGO_VERSION="9.3.2"
TANGO_RELEASE="9.3.2-alpha.1"
LOG4J_VERSION="1.2.17"

BUILD_SOURCE_DISTRIBUTION=1

sudo apt install -y \
  libmariadb-dev \
  libmariadbclient-dev \
  mariadb-server

sudo systemctl start mariadb
sudo systemctl enable mariadb

# install dependencies
sudo apt install -y \
  build-essential \
  cmake \
  autoconf \
  libtool \
  ant \
  omniidl \
  libomniorb4-dev \
  libcos4-dev \
  libomnithread4-dev \
  libzmq3-dev

sudo apt install openjdk-8-jre
java -version
sudo update-alternatives --config java
java -version
sudo apt install libmariadb-dev libmariadbclient-dev

# set environment
sudo cp -r --backup=numbered "$TANGOBOX_VM_DIR/etc"/* /etc/
sudo cp --backup=numbered "$TANGOBOX_VM_DIR/etc/tangorc" /etc/

# get, build and install tango from source distribution
sudo rm -rf "$TANGOBOX_BUILD_DIR"
mkdir -p "$TANGOBOX_BUILD_DIR"
cd "$TANGOBOX_BUILD_DIR"

if [[ $BUILD_SOURCE_DISTRIBUTION = 1 ]]; then
  git clone --branch prepare-9.3.3 --depth 1 https://github.com/tango-controls/TangoSourceDistribution.git
  cd TangoSourceDistribution
  ant build package
  cd ../
  tar xf TangoSourceDistribution/build/tango-dev.tar.gz
  cd tango-*/
else
  wget "https://github.com/tango-controls/TangoSourceDistribution/releases/download/$TANGO_RELEASE/tango-$TANGO_RELEASE.tar.gz"
  tar -zxf "tango-$TANGO_RELEASE.tar.gz"
  cd "$TANGOBOX_BUILD_DIR/tango-$TANGO_VERSION/"
fi

# run configure and make with sudo to allow mysql root access
sudo ./configure \
  --prefix=/usr/local \
  --without-zlib \
  --enable-mariadb \
  --with-mysql-admin=root \
  --with-mariadbclient-include="/usr/include/mysql" \
  --with-mariadbclient-lib="/usr/lib/x86_64-linux-gnu" \
  --enable-dbcreate \
  --enable-dbserver=yes
sudo make -j4
sudo make install
sudo ldconfig

# add missing log4j library
cd "$TANGOBOX_BUILD_DIR"
wget "http://ftp.man.poznan.pl/apache/logging/log4j/$LOG4J_VERSION/log4j-$LOG4J_VERSION.tar.gz"
tar -xzf "log4j-$LOG4J_VERSION.tar.gz"
sudo cp "apache-log4j-$LOG4J_VERSION/log4j-$LOG4J_VERSION.jar" /usr/local/share/java/
sudo ln -sf "/usr/local/share/java/log4j-$LOG4J_VERSION.jar" /usr/local/share/java/log4j.jar

mkdir -p /tmp/log/TagoRestServer

# update priviledges for database
sudo mysql -u root -e "create user if not exists tango identified by 'tango';"
sudo mysql -u root -e "grant all on tango.* to 'tango';"

sudo mysql -u root --database tango < "$TANGOBOX_DB_DIR/tango-2018-12-18-base.sql"
