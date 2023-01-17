echo ">Stop RPI MCU service"
systemctl stop klipper_mcu.service
echo ">Clean up sources"
cd ~/klipper && make KCONFIG_CONFIG=../klipper_config/src/.config_rpi clean
echo ">Build firmware"
cd ~/klipper && make KCONFIG_CONFIG=../klipper_config/src/.config_rpi 
echo ">Flash firmware"
cd ~/klipper && make KCONFIG_CONFIG=../klipper_config/src/.config_rpi flash
echo ">Start RPI MCU service"
systemctl stop klipper_mcu.service
