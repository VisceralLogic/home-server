#!/bin/bash

while true
do

	if [ -f "/home/dlink/.processed" ]
	then

		if [ -f "/home/dlink/.checked" ]
		then

			if [ "/home/dlink/.checked" -ot "/home/dlink/.processed" ]
			then

				#echo "newly processed JPG"
				touch "/home/dlink/.checked"

			else

				#echo "processing..."

				DATE=$(cat "/home/dlink/.processed")

				ffmpeg -framerate 30 -pattern_type glob -i "/home/dlink/processed/$DATE/*.jpg" -c:v libx264 -r 30 "/home/dlink/$DATE.mp4"

				rm "/home/dlink/.processed"
				rm "/home/dlink/.checked"
				rm -rf "/home/dlink/processed/$DATE"

			fi

		else

			#echo "checking for new JPGs"
			touch "/home/dlink/.checked"

		fi

		sleep 60

	else
	
		#echo "no .processed file"
		sleep 21600

	fi

done
