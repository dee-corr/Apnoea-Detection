#!/bin/bash

mosquitto_sub -h 52.10.138.118 -t sensorData -q 2 | while read line;
do
if [[ "$line" == *"@"* ]]; then
	l=$(echo $line | grep @);
	values=$(echo $l | cut -d '@' -f 1);
	tstamp=$(echo $l | cut -d '@' -f 2 | sed -r 's/^.{1}//');
	mysql --user=dee fyp -e "INSERT INTO "sensordata" VALUES ('d135632','c823536', '$values', '$tstamp')";
fi
done
