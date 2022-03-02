#! /bin/bash

cd /home/pi/ECEB-LED-Panel

nohup ./runCmd.sh &
echo $! > pid_out

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
            pidVal=$(<pid_out)
            kill $pidVal
            nohup ./runCmd.sh &
            echo $! > pid_out
            echo
        else
            echo -e ${FINISHED}Current branch is up to date with origin/master.${NOCOLOR}
    fi

    sleep 10
done