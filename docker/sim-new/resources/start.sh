#!/usr/bin/env bash

function register_device {
  local CLASS="$1"
  local INST="$2"
  shift 2
  for device in "$@"; do
    tango_register_device "$CLASS/$INST" "$CLASS" "$device"
  done
}

HOST=$(hostname --short)

set -x
set -e

# register_device GenericSimulator GunFocus elin/focus/b{1..4}coil

# register_device GenericSimulator adc \
#   elin/cool/{bun-temps,pbun-temps,sec-temps} \
#   elin/cool/temp-adc \
#   elin/gun/{gridv,heati,heatv,hv,pulsel,pulsev}-adc \
#   elin/mod01/{heati,heatv,hv,thyrheatv}-adc \
#   elin/mod02/{heati,heatv,hv,thyrheatv}-adc \
#   elin/rf/{bun-at,bun-ph,pbun-at,pbun-ph}-adc

# register_device GenericSimulator beam1 elin/focus/{buncher,lens,spare,triplet}

# register_device GenericSimulator beam2 elin/focus/{sect1,sect2}

# register_device GenericSimulator dac \
#   alin/o-cool/temp \
#   elin/gun/{gridv,headtv,hv,pulsel,pulsev}-dac \
#   elin/mod{1,2}/hv-dac \
#   elin/rf/{bun-at,pbun-at,pbun-ph}-dac

# register_device GenericSimulator klystron \
#   elin/focus/kly{1,1_1,1_2,1_3,2,2_1,2_2,2_3,3,4,5,6}

# register_device GenericSimulator linacrf elin/rf/bun-at

# register_device GenericSimulator simuCT \
#   sr/d-ct/{1,2,ict-bidon,pct-bidon}

# register_device GenericSimulator socool \
#   elin/intlk/0 \
#   elin/o-rf/freq \
#   elin/rf/{bun-ph,pbun-ph,sec-ph,sec-ph-dac}

# register_device GenericSimulator steer \
#   elin/steer/{bh1,bh2,bv1,bv2,chan16,gh1,gh2,gh3,gh4,gv1,gv2,gv3,gv4} \
#   elin/steer/{s1h1,s1h2,s1v1,s1v2,s2h1,s2h2,s2v1,s2v2} \
#   elin/steer/triplet

# register_device Simuleray 'test' \
#   elin/r-{beam,cool}/{off,on} \
#   elin/r-gun/{352M,economy,htoff,hton,hvoff,hvon,off,on,short} \
#   elin/r-mod/{economy,heatoff,heaton,hvoff,hvon} \
#   elin/r-f/{off,on} \
#   elin/v-rv/{0..4}

# register_device GenericMultiChannel GunFocus elin/focus/gun

# register_device GenericMultiChannel beam elin/focus/beam{1,2}

# register_device GenericMultiChannel klystron elin/focus/klystron{,1,2}

# register_device GenericMultiChannel steer elin/steer/{1,gun,pbunch}

# register_device LinacCooling linac elin/cool/1

# register_device LinacGun linac elin/beam/run

# register_device LinacGunAux linax elin/gun/aux

# register_device LinacHVPS linac elin/{gun,mod1,mod2}/hv

# register_device LinacModAux linac elin/mod{1,2}/aux

# register_device LinacModulator linac elin/mod/run-{1,2} elin/mod{1,2}/run

# register_device LinacRF linac elin/rf/run

# register_device Linac linac elin/master/op

# register_device LinacSequencer linac elin/master/seq

tango_register_device Starter/$HOST Starter tango/admin/$HOST

exec -- /usr/local/bin/Starter $HOST
