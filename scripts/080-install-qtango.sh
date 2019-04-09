#!/usr/bin/env bash

set -x
set -e

BUILD_DIR=~/work/tangobox/build

sudo apt install -y \
  qt5-default \
  libqwt-qt5-6 \
  libqwt-qt5-dev \
  libqt5x11extras5 \
  libqt5x11extras5-dev \
  libqt5designercomponents5 \
  qttools5-dev \
  qttools5-dev-tools \
  libxcb-xinerama0 \
  libqwt-dev \
  doxygen \
  graphviz \
  libxmu-dev

cd "$BUILD_DIR"
git clone --depth 1 "https://github.com/ELETTRA-SincrotroneTrieste/qtango.git"
cd qtango
qmake
make
sudo make install

sudo sh -c "echo '/usr/local/qtango/lib' > /etc/ld.so.conf.d/qtango.conf"
sudo ldconfig
