#! /bin/bash

cd /home/pi/ECEB-LED-Panel

./runCmd.sh

while true
do
    git fetch
    HEADHASH=$(git rev-parse HEAD)
    UPSTREAMHASH=$(git rev-parse master@{upstream})

    if [ "$HEADHASH" != "$UPSTREAMHASH" ]
        then
            echo -e ${ERROR}Not up to date with origin. Pulling.${NOCOLOR}
            git pull
            # restart script
            ps -ef | grep /home/pi/rpi-rgb-led-matrix/examples-api-use/demo | grep -v grep | awk '{print $2}' | sudo xargs kill
            ./runCmd.sh
            echo
        else
            echo -e ${FINISHED}Current branch is up to date with origin/master.${NOCOLOR}
    fi

    sleep 10
done