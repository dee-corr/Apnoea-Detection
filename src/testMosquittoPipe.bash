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
for line in `cat gattToolOutput.txt`
do
	echo Got: $line
done


