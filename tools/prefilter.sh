#!/bin/bash

for FILE
do
	echo "${FILE}"

	sed	-e 's/[ ]*$//g' \
		-e '/^[#] manufacturer_id/d' \
		-e '/^[#] version/d' \
		-i ${FILE}

	chmod 644 ${FILE}
done

