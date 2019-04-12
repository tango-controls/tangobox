#!/usr/bin/env bash

# This script installs examples

# install a SardanaGUI
pip install --user ~/examples/SardanaGUI/

# make jlinac example running
cd ~/bin/
ln -s ~/examples/linac/JLinac/jlinac

cd ~/Desktop/
ln -s ~/examples/ "Examples"
