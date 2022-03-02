#! /bin/bash

nohup sudo /home/pi/rpi-rgb-led-matrix/examples-api-use/demo --led-cols=128 --led-daemon -m 75 -D1 /home/pi/ECEB-LED-Panel/imgs/8-23.ppm &
echo $! > pid_out