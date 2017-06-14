#!/bin/sh

BROKER_ID=$(hostname | awk -F'-' '{print $NF}' | sed 's/[^0-9]*//g')

if [ "x$BROKER_ID" != "x" ]
then
BROKER_ID_OVERRIDE="--override broker.id=$BROKER_ID"
else
BROKER_ID_OVERRIDE=''
fi

if [ "x$ZOOKEEPER_URL" != "x" ]
then
ZOOKEEPER_CONNECT_OVERRIDE="--override zookeeper.connect=$ZOOKEEPER_URL"
else
ZOOKEEPER_CONNECT_OVERRIDE=""
fi

./bin/kafka-server-start.sh config/server.properties $BROKER_ID_OVERRIDE $ZOOKEEPER_CONNECT_OVERRIDE
