#!/usr/bin/env bash

set -x
set -e

BUILD_DIR=~/work/tangobox/build

sudo apt install -y \
  \
  build-essential \
  ninja-build \
  meson \
  git \
  doxygen \
  graphviz \
  \
  qt5-default \
  qtcreator \
  libqt5x11extras5-dev \
  qttools5-dev \
  qtscript5-dev \
  \
  qml-module-qtcharts \
  qml-module-qtquick-controls2 \
  qml-module-qtquick-dialogs \
  qml-module-qtquick-extras \
  qml-module-qtquick-scene2d \
  qml-module-qtquick-scene3d \
  qml-module-qtquick-templates2 \
  qtdeclarative5-dev \
  libqt5charts5-dev \
  qtcharts5-examples \
  qtcharts5-doc-html \
  libqwt-qt5-dev

cd "$BUILD_DIR"
git clone --depth 1 "https://github.com/ELETTRA-SincrotroneTrieste/cumbia-libs.git"
cd cumbia-libs
./scripts/cubuild.sh tango install
