#!/usr/bin/env bash

# NOTE: devices shall be registered and configured using json2tango script

set -x
set -e

HOST="tangobox-sim"

tango_add_to_starter "$HOST" 1 GenericSimulator/genericForLinac
tango_add_to_starter "$HOST" 2 GenericMultiChannel/multiForLinac
tango_add_to_starter "$HOST" 3 LinacMediumLevel/linac
tango_add_to_starter "$HOST" 4 LinacSequencer/linac
tango_add_to_starter "$HOST" 5 Linac/linac

# below is 9.3 deployment

# tango_add_to_starter "$HOST" 1 GenericSimulator/{\
# GunFocus,\
# adc,\
# beam1,\
# beam2,\
# dac,\
# genericForLinac,\
# klystron,\
# linacrf,\
# simuCT,\
# socool,\
# steer} \
# 'Simuleray/test'

# tango_add_to_starter "$HOST" 2 GenericMultiChannel/{\
# GunFocus,\
# beam,\
# klystron,\
# multiForLinac,\
# steer}

# tango_add_to_starter "$HOST" 3 \
#   LinacCooling/linac \
#   LinacGun/linac \
#   LinacGunAux/linac \
#   LinacHVPS/linac \
#   LinacModAux/linac \
#   LinacModulator/linac \
#   LinacRF/linac

# tango_add_to_starter "$HOST" 4 Linac{,MediumLevel}/linac

# tango_add_to_starter "$HOST" 5 LinacSequencer/linac
