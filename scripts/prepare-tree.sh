#!/usr/bin/env bash
cp -r ../vm/home/tango-cs/* /home/tango-cs/

cp -r ../docker/sim/resources/linac/* /home/tango-cs/examples/linac/

cp ../docker/base-new/resources/tango_register_device ~/bin/
cp ../docker/base-new/resources/tango_add_to_starter ~/bin/
