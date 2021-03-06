#!/usr/bin/env bash

if [ "$1" = "-r" ]
then
    rm $HOME/.externalip
    exit 0;
fi
cacheFile="$HOME/.externalip"
if [ ! -f "$cacheFile" ] || [ ! "$(cat $cacheFile)" ]
then
    wget http://checkip.dyndns.org/ -q -O - | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>' > "$cacheFile"
fi
echo $(cat "$cacheFile")