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
	- `./prepare-tree.sh` - to generate */home/tango-cs* folders structure 
	- `./install-docker.sh` - to install docker tools
	- `./install-tango.sh` - to install tango from source distribution
	- `./install-services.sh` - to make tango componets (Database, Starter, Access Control) starts as servcies
	- `./install-tools.sh` - to install various Tango Contorls tools (PyTango, HDB/TDB, SNAP, HDB++, ...)
	- `./configure-tango.sh` - to populate tango database with demo related devices	
	- `./deploy-containers.sh` - to create containers with services (HDB++, HDB/TDB/SNAP, Waltz, Linac simulation, ...)
	- `./install-examples.sh` - to install example applications
	- `./install-documentation.sh`	- to provide documentation developement environment (in ~/work/documentation)
	- `./clean-disks.sh` - if you want to save diskspace before releasing
	- `./light-release.sh` - if you want to make light release (without docker images built)
	- `./make-containers.sh` - this script is provided for the light verstion, to be lunched after download to build docker containers
	

