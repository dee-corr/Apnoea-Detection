#!/bin/bash
#File name: m2t.sh
#Author: Deirdre Corr
#Description: This daemon script subscribes to the raw data topic and appends any output from the topic to a text file
# if there is no input received within 10 seconds, the script stops waiting for input and sleeps for 30 seconds before restarting

#empty dataFile
> rawFile.txt

TMOUT=10;
#subscribe to data from the rawData topic
mosquitto_sub -h 52.10.138.118 -t rawData -q 2 |
#end loop if waiting for over 10 seconds
while read -t 10 line;
do
	#remove timestamp data (irrelevant data for R processing)
	l=$(echo $line | cut -d'@' -f 1);
	#remove x and y hex values, leaving z
	l=$(echo $l | sed -r 's/^.{12}//');
	#remove whitespace
	l=$(echo "${l//[[:space:]]/}");
	#convert hex value to 16 bit decimal
	echo $((16#$l)) >> rawFile.txt;
done;

#append eof to text file
#echo "eof" >> rawFile.txt
