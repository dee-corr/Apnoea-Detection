#!/bin/bash

#############################
# Deirdre Corr
# Mon 16 Feb 2015 15:18:20 GMT
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
mosquitto_pub -h ec2-54-148-240-101.us-west-2.compute.amazonaws.com -l -t test -q 2
done


