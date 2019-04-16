#!/usr/bin/env bash

set -x
set -e

BUILD_DIR=~/work/tangobox/build
PIP_INSTALL_FLAGS='--user'

sudo apt install -y \
  python-pip \
  python-qt4 \
  qt4-designer \
  python-qwt \
  python-qwt5-qt4 \
  python-guiqwt \
  python-numpy \
  pymca \
  python-pymca5 \
  libboost-python-dev \
  python-pyqt5.qtwebkit \
  python-pyqt5.qtsvg \
  python-spyder \
  python-spyderlib \
  python-html5lib \
  python-ipython \
  python-ply

pip install ${PIP_INSTALL_FLAGS} numpy
pip install ${PIP_INSTALL_FLAGS} sphinx
pip install ${PIP_INSTALL_FLAGS} sphinx_rtd_theme
pip install ${PIP_INSTALL_FLAGS} lxml

cd "$BUILD_DIR"
git clone --branch v9.3.0 https://github.com/tango-controls/pytango.git
cd pytango/
git cherry-pick bfdc6bbbd5077b2a5b0a4ee8c846d746117b192a # is_empty patch
git cherry-pick c09c337a0d594825952f797c8fa9de5d09fe890c # six 1.12 requirement
python setup.py bdist_wheel

pip install ${PIP_INSTALL_FLAGS} $BUILD_DIR/pytango/dist/pytango-*.whl
pip install ${PIP_INSTALL_FLAGS} itango
pip install ${PIP_INSTALL_FLAGS} taurus
pip install ${PIP_INSTALL_FLAGS} sardana
pip install ${PIP_INSTALL_FLAGS} git+https://github.com/S2Innovation/lib-maxiv-dsconfig.git@dump-class-properties

pip install ${PIP_INSTALL_FLAGS} --force-reinstall $BUILD_DIR/pytango/dist/pytango-*.whl
