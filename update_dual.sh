#!/bin/bash
sudo mount -o remount,rw /
#Install Required Software
wget https://github.com/bd7idi/mmdvm-fw/blob/master/mmdvm_f1_dual.bin
#wget https://github.com/bd7idi/mmdvm-fw/blob/master/mmdvm_f1_dual.bin
# DV-Mega Mods
sudo systemctl stop mmdvmhost.timer
sudo systemctl stop mmdvmhost.service
sudo stm32flash -v -w mmdvm_f1_dual.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0
sudo systemctl start mmdvmhost.timer
sudo systemctl restart mmdvmhost.service
sudo rm mmdvm_f1_dual.bin
sudo rm update_dual.sh
sudo mount -o remount,ro /
