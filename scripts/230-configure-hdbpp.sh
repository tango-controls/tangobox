#!/usr/bin/env bash

set -x
set -e

HOST=tangobox-hdbpp

tango_register_device 'hdb++es-srv/1' HdbEventSubscriber      archiving/hdbpp/eventsubscriber.1
tango_register_device 'hdb++cm-srv/1' HdbConfigurationManager archiving/hdbpp/configurationmanager.1

tango_add_to_starter ${HOST} 2 'hdb++es-srv/1'
tango_add_to_starter ${HOST} 3 'hdb++cm-srv/1'
