#!/usr/bin/env bash

set -x
set -e

ARCHIVE_HOST=tangobox-archive

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

tango_add_to_starter ${ARCHIVE_HOST} HdbArchiver/01                2
tango_add_to_starter ${ARCHIVE_HOST} SnapArchiver/01               2
tango_add_to_starter ${ARCHIVE_HOST} TdbArchiver/01                2
tango_add_to_starter ${ARCHIVE_HOST} ArchivingManager/1            3
tango_add_to_starter ${ARCHIVE_HOST} SnapManager/1                 3
tango_add_to_starter ${ARCHIVE_HOST} HdbExtractor/1                4
tango_add_to_starter ${ARCHIVE_HOST} SnapExtractor/1               4
tango_add_to_starter ${ARCHIVE_HOST} TdbExtractor/1                4
tango_add_to_starter ${ARCHIVE_HOST} HDBTDBArchivingWatcher/HDBTDB 5
