echo ">Stop RPI MCU service"
systemctl stop klipper_mcu.service
echo ">Clean up sources"
cd ~/klipper && make KCONFIG_CONFIG=~/klipper_config/config_rpi_mcu clean
echo ">Build firmware"
cd ~/klipper && make KCONFIG_CONFIG=~/klipper_config/config_rpi_mcu
echo ">Flash firmware"
cd ~/klipper && make KCONFIG_CONFIG=~/klipper_config/config_rpi_mcu flash
echo ">Start RPI MCU service"
systemctl stop klipper_mcu.service
