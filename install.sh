#!/bin/bash

sudo apt update

sudo apt dist-upgrade -y

sudo apt install python-pip libcurl3 npm xdotool firefox

sudo pip install faker

sudo npm install fmg2

chmod +x html2dic

sudo cp html2dic /usr/local/bin/

sudo cp /usr/bin/nodejs /usr/bin/node

mv register-faker 1

chmod +x 1

echo  '#function run\nrun() {\n	number=$1\n	shift\n	for i in `seq $number`; do\n	$@\n	done\n}' >>  ~/.bashrc 


source ~/.bashrc
