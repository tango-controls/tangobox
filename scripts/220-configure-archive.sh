#!/usr/bin/env bash

set -x
set -e

HOST=tangobox-archive

tango_register_device HdbArchiver/01      HdbArchiver         archiving/hdb/hdbarchiver.01_01
tango_register_device HdbArchiver/01      HdbArchiver         archiving/hdb/hdbarchiver.01_02
tango_register_device SnapArchiver/01     SnapArchiver        archiving/snap/snaparchiver.01_01
tango_register_device SnapArchiver/01     SnapArchiver        archiving/snap/snaparchiver.01_02
tango_register_device TdbArchiver/01      TdbArchiver         archiving/tdb/tdbarchiver.01_01
tango_register_device TdbArchiver/01      TdbArchiver         archiving/tdb/tdbarchiver.01_02
tango_register_device ArchivingManager/1  ArchivingManager    archiving/hdbtdb/archivingmanager
tango_register_device SnapManager/1       SnapManager         archiving/snap/snapmanager.1
tango_register_device HdbExtractor/1      HdbExtractor        archiving/hdb/hdbextractor.1
tango_register_device SnapExtractor/1     SnapExtractor       archiving/snap/snapextractor.1
tango_register_device TdbExtractor/1      TdbExtractor        archiving/tdb/tdbextractor.1
tango_register_device HDBTDBArchivingWatcher/HDBTDB HDBTDBArchivingWatcher archiving/hdbtdb/hdbtdbarchivingwatcher.1

tango_add_to_starter ${HOST} 2 HdbArchiver/01
tango_add_to_starter ${HOST} 2 SnapArchiver/01
tango_add_to_starter ${HOST} 2 TdbArchiver/01
tango_add_to_starter ${HOST} 3 ArchivingManager/1
tango_add_to_starter ${HOST} 3 SnapManager/1
tango_add_to_starter ${HOST} 4 HdbExtractor/1
tango_add_to_starter ${HOST} 4 SnapExtractor/1
tango_add_to_starter ${HOST} 4 TdbExtractor/1
tango_add_to_starter ${HOST} 5 HDBTDBArchivingWatcher/HDBTDB 5

python -c "import tango; tango.Database().put_device_property('tango/admin/${HOST}', {'StartDsPath': ['/usr/bin', '/usr/local/bin']})"
