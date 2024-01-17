#!/bin/bash

echo ">Stopping services"
systemctl stop klipper klipper-mcu
echo ">Clean up SKR sources"
cd ~/klipper && make KCONFIG_CONFIG=/home/pi/printer_data/config/firmware/config_skr_pico_mcu clean
echo ">Build SKR firmware"
cd ~/klipper && make KCONFIG_CONFIG=/home/pi/printer_data/config/firmware/config_skr_pico_mcu
pinctrl set 26 op
pinctrl set 26 dl
sleep 0.5
pinctrl set 26 dh
sleep 0.5
pinctrl set 26 dl
sleep 0.5
pinctrl set 26 dh
pinctrl set 26 ip
echo ">Flash SKR firmware"
python3 ~/katapult/scripts/flash_can.py -f ~/klipper/out/klipper.bin -d  /dev/ttyAMA0
echo ">Clean up RPi MCU sources"
cd ~/klipper && make KCONFIG_CONFIG=/home/pi/printer_data/config/firmware/config_rpi_mcu clean
echo ">Build RPi MCU firmware"
cd ~/klipper && make KCONFIG_CONFIG=/home/pi/printer_data/config/firmware/config_rpi_mcu
echo ">Flash RPi MCU firmware"
cd ~/klipper && make KCONFIG_CONFIG=/home/pi/printer_data/config/firmware/config_rpi_mcu flash
echo ">Starting services"
systemctl start klipper klipper-mcu
