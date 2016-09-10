#!/bin/bash
#
# Filename    : nexus-apk-backup.sh
# Description : This shell script is used for backup android apk packages.
# Author      : mutse <yyhoo2.young@gmail.com>
# Date        : Sep 9th, 2016
# Version     : 0.1
#

# for apk packages backup
for line in $(adb shell pm list packages -f -3)
    do
        apk_name=`echo $line | cut -d "=" -f 2 | tr -d '\r\n'`
        apk_path=`echo $line | cut -d "=" -f 1 | cut -d ":" -f 2`
        #echo "name: " $(apk_name)
        #echo "path: " $(apk_path)
        adb pull $apk_path ./$apk_name.apk
done
