#!/bin/bash
# Frankie McEyes (https://github.com/frankie-mceyes/HMTNT)
# v1.0

URL_SOURCE="https://check.torproject.org/exit-addresses"
WORKDIR="$HOME/HMTNT/$(date +%d_%m_%Y)"
FILENAME=$(date +%d_%m_%Y-%H.%M)

if ! [ -d $WORKDIR ]
then
	mkdir $WORKDIR
fi

curl -s -l -k "$URL_SOURCE" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort -u >> $WORKDIR/$FILENAME
