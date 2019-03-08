# TangoBox 9.3

TangoBox is a virtual appliance providing demo installation of Tango Controls and its various tools, see: https://tango-controls.readthedocs.io/en/latest/installation/virtualmachine.html. For more info about Tango Controls see the webpage: http://tango-controls.org

## What is it in this repository

This repository contains scripts and assets (files, Dockerfiles) to build a demo machine. However, to provide the demo machine it requiers some manual intervention. It may be used also to findout how to install the Tango Controls. 

This release is based on Ubuntu 18.04LTS.

There are two types of releases:

- A standard one, which is a big .ova file. It contains all tools pre-installed and pre-built all docker containers. 
  All its functionality is available directly after importing to VirtualBox or VMware.  
- A **'light'** one, which has no pre-built docker containers. To use all its feature it is necessary to built containers, 
  when the VM is started for the first time. 

## How to use a '-light' release
- unzip the file (if downloaded the zipped version)
- import the .ova into VirutalBox or VMware player,
- start the virtual machine,

When logged-in for the first time:
- run a terminal,
- invoke command: `make-containers.sh`, 
- be patient...

This will build and start docker containers with various Tango Controls services.

It may take even few hours. However, it needs to be done only once, while running the VM for the first time.

## How to build a tangobox from scratch

To build a tangobox using this repository, one need to:
- create a clean VM with Ubungtu 18.04LTS, with a user tango-cs,
- login as the tango-cs user,
- open a terminal,
- install git (`sudo apt install git`),
- create a folder /home/tango-cs/work/tangobox/src (`mkdir -p ~/work/tangobox/src`),
- go to this folder (`cd ~/work/tangobox/src`),
- clone this repository there (`git clone https://github.com/tango-controls/tangobox`),
- go to a scripts folder (`cd tangobox/scripts`),
- use the scripts:
	- `./prepare-tree.sh` - to generate */home/tango-cs* folders structure ,
	- `./install-docker.sh` - to install docker tools,
	- `./install-tango.sh` - to install the tango from source distribution,
	- `./install-services.sh` - to make tango componets (Database, Starter, Access Control) starts as servcies,
	- `./install-tools.sh` - to install various Tango Contorls tools (PyTango, HDB/TDB, SNAP, HDB++, ...),
	- `./configure-tango.sh` - to populate a tango database with demo related devices,
	- `./deploy-containers.sh` - to create containers with services (HDB++, HDB/TDB/SNAP, Waltz, Linac simulation, ...),
	- `./install-examples.sh` - to install example applications,
	- `./install-documentation.sh`	- to provide a documentation developement environment (in ~/work/documentation),
	- `./clean-disks.sh` - if you want to save diskspace before releasing,
	- `./light-release.sh` - if you want to make a light release (without docker images built),
	- `./make-containers.sh` - this script is provided for the light verstion, to be lunched after download to build the docker containers,
	
**Then, have a fun dancing with Tango Controls!**.
