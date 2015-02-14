#!/bin/bash

#############################
# Deirdre Corr
# Sat 14 Feb 2015 14:37:50 GMT
# DT228-4 FYP
#
#############################
#
# Script to test the provision 
# of messages via a pipeline
# to the mosquitto_pub utility
#
#############################

# TEST-1
# the following will read each WORD rather than 
# each line from the input file
while read  line
do
	echo Got: $line
	echo Mark Says: $line | mosquitto_pub -h ec2-54-148-240-101.us-west-2.compute.amazonaws.com -s -t test -q 2
done


