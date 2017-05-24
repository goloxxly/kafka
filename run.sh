#!/bin/sh

BROKER_ID=$(hostname | awk -F'-' '{print $2}' | sed 's/[^0-9]*//g')

if [ "x$BROKER_ID" != "x" ]
then
BROKER_ID_OVERRIDE="--override broker.id=$BROKER_ID"
else
BROKER_ID_OVERRIDE=''
fi

./bin/kafka-server-start.sh config/server.properties $BROKER_ID_OVERRIDE
