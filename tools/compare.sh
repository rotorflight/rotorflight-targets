#!/bin/bash

SRC=${1:betaflight-targets}/configs/default


echo "Comparing files..."

for FILE in configs/*.config
do
	CONFIG=${FILE##*/}
	TARGET=${CONFIG%%.config}

	BETA=${SRC}/${CONFIG}

	if [ -f ${BETA} ]
	then
		diff --color=always -u ${BETA} ${FILE}
	else
		echo "Target ${TARGET} not in BF"
	fi

done

echo "Checking for new targets..."

for FILE in ${SRC}/*.config
do
	CONFIG=${FILE##*/}
	TARGET=${CONFIG%%.config}

	RTFL=configs/${CONFIG}

	if [ ! -f ${RTFL} ]
	then
		echo "New ${TARGET} in BF"
	fi
done

