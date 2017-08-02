#!/usr/bin/env bash

function usage() { 
    echo "Use this script to start RabbitMQ + databases for one or more services"
    echo -e "\nUsage:\n$0 [services] \n" 
}

if [  $# -le 0 ] 
    then 
        usage
        exit 1
    fi 
 
if [[ ( $1 == "--help") ||  $1 == "-h" ]] 
then 
    usage
    exit 0
fi

services='rmq rmq_exchanges '

for var in "$@"
do
    services="$services ${var//-/_}_postgres"
done

docker-compose up $services