# TangoBox 9.3

TangoBox is a virtual appliance providing demo installation of Tango Controls and its various tools, see: https://tango-controls.readthedocs.io/en/latest/installation/virtualmachine.html. For more info about Tango Controls see the webpage: http://tango-controls.org

This repository contains scripts and assets (files, Dockerfiles) to build a demo machine. However, to provide the demo machine it requiers some manual intervention. It may be used also to findout how to install the Tango Controls. 

This release is based on Ubuntu 18.04LTS.

To build a TangoBox using this repository, one need to:
- create a clean VM with Ubungtu 18.04LTS, with a user tango-cs
- login as tango-cs user
- open terminal
- install git (`sudo apt install git`)
- create folder /home/tango-cs/work/tangobox/src (`mkdir -p ~/work/tangobox/src`)
- go to this folder (`cd ~/work/tangobox/src`)
- clone this repository there (`git clone https://github.com/tango-controls/tangobox`)
- go to scripts folder (`cd tangobox/scripts`)
- use the scripts:
	- `./clean-disks.sh`	
	- `./configure-tango.sh`
	- `./deploy-containers.sh`
	- install-docker.sh 
	- install-documentation.sh
	- install-examples.sh 
	- install-services.sh 
	- install-tango.sh
	- install-tools.sh 
	- light-release.sh
	- make-containers.sh
	- prepare-tree.sh

