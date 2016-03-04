#!/bin/bash

#echo "testing $1" >> /home/dlink/test.txt
if echo "$1" | grep -q "\.jpg$" ; then
	#echo "$1" >> /home/dlink/process.log
	TIMESTAMP=$(stat -c "%y" "$1" | grep -Eo "^.{19}")
	FILENAME=$(echo "$1" | grep -Eio "[^/]+\.jpg")
	DATE=$(date +"%Y%m%d")
	echo "$TIMESTAMP: $1" >> /home/dlink/process.log
	if [ ! -d "/home/dlink/processed/$DATE" ] ; then
		mkdir "/home/dlink/processed/$DATE"
		chown dlink "/home/dlink/processed/$DATE"
	fi
	convert "$1" -pointsize 18 -draw "gravity northwest fill red text 0,12 '$TIMESTAMP'" "/home/dlink/processed/$DATE/$FILENAME"
	rm "$1"
	printf "$DATE" > /home/dlink/.processed
fi
