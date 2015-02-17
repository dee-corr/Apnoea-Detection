#!/bin/bash

#############################
# Deirdre Corr
# Tue 17 Feb 2015 14:27:35 GMT
# DT228-4 FYP
#
#############################
#
# Script to output a line of 
# text from the file sampledata.txt
# every 2 seconds, forever
#
# of messages via a pipeline
# to the mosquitto_pub utility
#
#############################

while :
do
	while read line
	do
		echo $line | cut -d' ' -f1,2
		sleep 2
	done < sampledata.txt
done
