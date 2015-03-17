#!/bin/sh
#File name: t2r.sh
#Author: Deirdre Corr
#Description: This daemon script sends a text file to the r script for
# counting the number of apnoeas within that data set. If the file is
# less than 256 samples, publish an error message to MQTT to inform the
# user

file=$1;

#put the number of lines within the text file into a variable
lineCount=$(cat $file | wc -l);
echo $lineCount;
#lineCount = $lineCount - 1;

#if there is less than 512 values (a minute long sample at 10Hz sampling rate)
if [ "$lineCount" -lt 512 ]; then
	#notify the user that the length must be over one minute
	mosquitto_pub -h 52.10.138.118 -m "Error: Recording length must be 1 minute or more" -t processedData -q 1
	echo "enters here"
else
	echo "goes to R";
	#if not, run the r script to detect the number of apnoeas within that data set and publish to MQTT
	#Rscript fft.r 1 $lineCount 10 50 32 "$file" | bash r2m.sh;
	Rscript fft.r 1 280 5 50 32 "/home/ubuntu/testTras.txt" | bash r2m.sh;
	< rawFile.txt
fi
