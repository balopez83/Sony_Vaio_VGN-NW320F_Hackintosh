#!/bin/bash

# Version 20090703 GMA X4500MHD mod by Trauma
# Version 20090705.2 GMA 4-series mod by uman (coldequation)

#
# This script takes stock AppleIntelGMAX3100 kexts, copies them, and patches 
# the copies to include the device for your Intel 4-series as determined by
# lspci. Optionally the device id can be passed via the -id option to this
# script.
#
# NOTE: The original kexts are not touched.
#
# It is hoped that this script will enable Quartz Extreme and Core Image on 
# machines that have Intel 4-series chipsets.
#
# If the stock kexts get updated, just run this script again
# so that your patched drivers get updated as well.
# This has been tested with stock 10.5.7 kexts.
#

ME=${0##*/}
VERSION=20090705.2
HELP="This script takes stock AppleIntelGMAX3100 kexts, copies them, and patches\n\
the copies to include the device for your Intel 4-series as determined by\n\
lspci. Optionally the device id can be passed via the -force option to this\n\
script. If the -res option is passed, you should be able to boot in normal mode\n\
using native resolution, but you will NOT get QE/CI when we figure that out.\n\
\n\
NOTE: Your original kexts are not touched.\n\
\n\
It is hoped that eventually this script will enable Quartz Extreme and Core Image\n\
on machines that have Intel 4-series chipsets.\n\
\n\
If you update your stock kexts, just run this script again\n\
so that your patched drivers get updated as well.\n\
This has been tested with stock 10.5.7 kexts."

USAGE="Usage: ${ME}\n\
-v: print version\n\
-h: print help\n\
-r: Tienneke native resolution fix
-f DEVID - patch with passed DEVID instead of lspci lookup\n\n\
Example: ${ME} -vf 2e12\n"

#
# Process command-line
#
while getopts "hvrf:" optionName; do
	case "$optionName" in
		h)  echo -e "${HELP}\n\n${USAGE}"
			exit 1;;
		v) echo "${ME}: version $VERSION";;
		r) RESFIX=1;;
		f) DEVID="$OPTARG";;
		[?]) echo -e "\n${USAGE}"
			 exit 1
	esac
done

#
# IF we have forced DEVID, then (test if is 4 digits and a hex value)
#

if [ "$DEVID" != "" ]; then
	if [ ${#DEVID} -ne 4 ]; then
		echo "${ME}: Forced device ID must be exactly 4 hex digits."
		exit 1
	fi
	
    case $DEVID in
        *[!0-9a-fA-F]*)
          echo "${ME}: Invalid hex value in forced device ID."
          exit 1;;
        *)
          ;;
    esac
    
    # OK, so uppercase it
	DEVID=`echo ${DEVID} | tr '[:lower:]' '[:upper:]'`


else

	# ELSE no ID is passed with -f option, then get it from lspci

	# Test if lspci is installed and in user's path
	LSPCI=$(which lspci)
	if [ "$LSPCI" == "" ]; then
    	echo "${ME}: LSPCI not found: Please install or use -f option to specify a device id."
    	exit 1
	fi

	# find if a device ids corresponding to the 4-series chipset is installed
	IDS="2a42 2a43 2e02 2e03 2e12 2e13 2e22 2e23 2e32 2e33"
	i=4
	while [ $i -le ${#IDS} ]; do
		if [ "$($LSPCI -mnd 8086:${IDS:i-4:4})" != "" ]; then
			DEVID=`echo ${IDS:i-4:4} | tr '[:lower:]' '[:upper:]'`
			echo "${ME}: Found 4-series with device id $DEVID."
			break
		fi
		let i=i+5
	done

	# None found, bail out
	if [ "$DEVID" == "" ]; then
		echo "${ME}: 4 Series Chipset Integrated Graphics Controller NOT found."
		exit 1
	fi
fi

#
# Make sure only root can run this script
#

if [ "$(id -u)" != "0" ]; then
   echo "${ME}: This script must be run as root." 1>&2
   exit 1
fi

#
# If we already have a patched driver, remove it
#

rm -r /System/Library/Extensions/${DEVID}AppleIntelGMAX3100FB.kext 2>/dev/null
rm -r /System/Library/Extensions/${DEVID}AppleIntelGMAX3100.kext 2>/dev/null


#
# Copy stock kext; this way we keep the original as it is
#

cp -r /System/Library/Extensions/AppleIntelGMAX3100FB.kext \
/System/Library/Extensions/${DEVID}AppleIntelGMAX3100FB.kext
cp -r /System/Library/Extensions/AppleIntelGMAX3100.kext \
/System/Library/Extensions/${DEVID}AppleIntelGMAX3100.kext

#
# Patch GMAX3100 ID 2A02 with $DEVID
#

perl -pi -e "s|\x86\x80\x02\x2A|\x86\x80\x${DEVID:2:2}\x${DEVID:0:2}|g" /System/Library/Extensions/${DEVID}AppleIntelGMAX3100FB.kext/AppleIntelGMAX3100FB 
perl -pi -e "s|\x86\x80\x02\x2A|\x86\x80\x${DEVID:2:2}\x${DEVID:0:2}|g" /System/Library/Extensions/${DEVID}AppleIntelGMAX3100.kext/Contents/MacOS/AppleIntelGMAX3100 
perl -pi -e "s|2A028086|${DEVID}8086|g" /System/Library/Extensions/${DEVID}AppleIntelGMAX3100FB.kext/Info.plist
perl -pi -e "s|00008086|${DEVID}8086|g" /System/Library/Extensions/${DEVID}AppleIntelGMAX3100.kext/Contents/Info.plist

#
# Do a checksum and tell the user whether he has a known good one
#

MD5A=$(md5 -q /System/Library/Extensions/${DEVID}AppleIntelGMAX3100FB.kext/AppleIntelGMAX3100FB) 
MD5B=$(md5 -q /System/Library/Extensions/${DEVID}AppleIntelGMAX3100.kext/Contents/MacOS/AppleIntelGMAX3100)
if [ "$MD5A" == "763cb3ad8c3a385ae2ff7cc79cfb596e" ] ; then
    echo "${ME}: Patched AppleIntelGMAX3100FB from stock 10.5.7 (known good)"
else
    echo "${ME}: This is not a tested (stock 10.5.7) AppleIntelGMAX3100FB version, but it might work anyway."
fi

if [ "$MD5B" == "aa5172d5faf2268fbf00f3e82dbac47b" ] ; then
    echo "${ME}: Patched AppleIntelGMAX3100 from stock 10.5.7 (known good)"
else
    echo "${ME}: This is not a tested (stock 10.5.7) AppleIntelGMAX3100 version, but it might work anyway."
fi

#
# Delete WindowServer preferences files (needed in case someone had mirroring on, which does not work)
#

find /Users/*/Library/Preferences/ -iname com.apple.windowserver.*.plist -delete
find /Library/Preferences/ -iname com.apple.windowserver.plist -delete

# 
# Tienneke native resolution fix
#

if [ "$RESFIX" == "1" ]; then
	echo "${ME}: Removing ${DEVID}AppleIntelGMAX3100.kext"
	rm -r /System/Library/Extensions/${DEVID}AppleIntelGMAX3100.kext 2>/dev/null
fi	

#
# Trigger kextcache rebuild
#

touch /System/Library/Extensions

#
# Reboot needed
# 

echo "${ME}: Please reboot now!"
exit 0