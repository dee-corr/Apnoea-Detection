#/bin/bash

pid=$(ps -opid= -C DF1Record.sh)
while [ -d /proc/$pid ] ; do
    sleep 1
done && ./appendEOF.sh

