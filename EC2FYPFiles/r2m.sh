#!/bin/bash

while read line
do
	mosquitto_pub -h ec2-52-10-138-118.us-west-2.compute.amazonaws.com -m "$line" -t testtopic -q 2
done
