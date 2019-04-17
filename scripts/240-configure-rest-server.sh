#!/usr/bin/env bash

set -x
set -e

sudo apt install libtcnative-1 ssl-cert
sudo usermod -a -G ssl-cert tango-cs

tango_register_device TangoRestServer/rest TangoRestServer sys/rest/0
tango_add_to_starter `hostname --short` 5 TangoRestServer/rest
