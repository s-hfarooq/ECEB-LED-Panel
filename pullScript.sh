#! /bin/bash

cd /home/pi/ECEB-LED-Panel

while true
do
    git fetch
    HEADHASH=$(git rev-parse HEAD)
    UPSTREAMHASH=$(git rev-parse master@{upstream})

    if [ "$HEADHASH" != "$UPSTREAMHASH" ]
        then
            echo -e ${ERROR}Not up to date with origin. Aborting.${NOCOLOR}
            git pull
            echo
            exit 0
        else
            echo -e ${FINISHED}Current branch is up to date with origin/master.${NOCOLOR}
    fi

    sleep 10
done