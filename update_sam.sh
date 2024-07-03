#!/bin/bash
sudo mount -o remount,rw /
#Install Required Software
wget https://github.com/bd7idi/mmdvm-fw/blob/master/mmdvm_f1_sam.bin
#wget https://github.com/bd7idi/mmdvm-fw/blob/master/mmdvm_f1_sam.bin
# DV-Mega Mods
sudo systemctl stop mmdvmhost.timer
sudo systemctl stop mmdvmhost.service
sudo sudo stm32flash -v -w mmdvm_f1_sam.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0
sudo systemctl start mmdvmhost.timer
sudo systemctl restart mmdvmhost.service
sudo rm mmdvm_f1_sam.bin
sudo rm update_sam.sh
sudo mount -o remount,ro /
