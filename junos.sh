#!/bin/bash

#
# Script that reads hostip file and executes an expect script to log in and get
# info from the routers. 
#
# Check that hostip file with router information exists, exit the script if the file does not exists.
#

if [ ! -f ./hostfile ]; then
    echo "hostfile File not found!"
    exit 1
fi

# create a new directory for today, to save outputs to it.

deploydir=$(date +%d%m)

mkdir -p $deploydir

# Read IP address, username & password in file "hostip" and execute expect
# script for each line
#

filename=$(date +%d%m%Y_%T)

echo $filename

cat hostfile | while read hostip
do
        echo $hostip $username $password $filename $deploydir
        # skip commented routers.
        if [[ $hostip =~ ^# ]]; then continue; fi
        #if [[ ! -z "$hostip" && ! -z "$username" && ! -z "$password" ]]  
        expect ssh.expect $hostip $username $password $filename $deploydir
        #expect telnet.expect $hostip $username $password $filename deploydir
done

if [ "$1" == '-c' ]; then
tar -cvf $deploydir.tar $deploydir
gzip -f $deploydir.tar
fi
