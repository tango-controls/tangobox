#!/usr/bin/env bash

set -x
set -e

# This script installs set of  Tango tools

# Python tools
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

pip install --user \
  numpy \
  sphinx \
  sphinx_rtd_theme \
  lxml \
  pytango \
  fandango \
  PyTangoArchiving \
  itango \
  taurus \
  panic \
  sardana \

# archiving suit from SOLEIL (java)
mkdir -p ~/work/tangobox/build
cd ~/work/tangobox/build/
wget -O ArchivingRoot.zip https://sourceforge.net/projects/tango-cs/files/tools/ArchivingRoot-16.2.4.zip/download
mkdir -p ~/tools/archiving-java
unzip -d ~/tools/archiving-java/ ArchivingRoot.zip
# update start scripts to use bash
cd ~/tools/archiving-java/bin/linux
sed -i 's/\/bin\/sh/\/bin\/bash/' *
# make sure the executables are executable
chmod +x *
# link executables in ~/bin
ln -s ~/tools/archiving-java/bin/linux/* ~/bin/

# HDB++
mkdir -p ~/tools/archiving-hdbpp
cd ~/tools/archiving-hdbpp
mkdir java
cd java
wget -O hdbpp-configurator.jar https://bintray.com/tango-controls/maven/download_file?file_path=org%2Ftango%2Fhdb%2Fhdbpp-configurator%2F3.10%2Fhdbpp-configurator-3.10.jar
# wget http://ftp.esrf.eu/pub/cs/tango/hdbviewer/HDB++.jar
wget -O libhdbpp-java.jar https://bintray.com/tango-controls/maven/download_file?file_path=org%2Ftango%2Flibhdbpp-java%2F1.21%2Flibhdbpp-java-1.21.jar
wget http://ftp.esrf.eu/pub/cs/tango/hdbviewer/jcalendar.jar
wget http://ftp.esrf.eu/pub/cs/tango/hdbviewer/jython.jar
wget -O jhdbviewer.jar https://bintray.com/tango-controls/maven/download_file?file_path=org%2Ftango%2Fjhdbviewer%2F1.14%2Fjhdbviewer-1.14.jar
cd ../bin
chmod +x *
ln -s -t ~/bin ~/tools/archiving-hdbpp/bin/*
