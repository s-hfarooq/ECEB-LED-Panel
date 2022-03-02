# ECEB-LED-Panel


Repo for images shown on LED panel in ECE 110 Lab room as seen from the ECEB Atrium. 


To change image: Upload a ppm file into the `imgs` folder and change the image name found in `runCmd.sh`. The Pi automatically checks for updates every 10 seconds. 

Uses [this](https://github.com/hzeller/rpi-rgb-led-matrix) library to control the panels. 