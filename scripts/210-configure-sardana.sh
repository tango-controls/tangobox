#!/usr/bin/env bash

# Please stop and delete any sardana1 server before running this script.

set -x
set -e

rm -rf /tmp/tango/Sardana/
rm -rf ~/.ipython/profile_spockdoor/

Sardana sardana1 << EOF &
y
...
EOF

SARDANA_PID=$!

# Give the server some time to start (10s is not enough). Solves below issue:
# An error occurred while running Macro 'sar_demo() -> 84894c5c-5d1f-11e9-858f-080027609c00':
# Either of: Controller with name motctrl01 does not exist or Controller with name motctrl01 does not exist made it impossible to decode parameters
sleep 20

spock << EOF
y
Door_sardana1_1
sar_demo
lsm
ascan gap01 0.9 1.1 4 1
exit
...
EOF

kill $SARDANA_PID
