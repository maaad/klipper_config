echo ">Clean up sources"
cd ~/klipper && make KCONFIG_CONFIG=~/klipper_config/src/config_lcd_mcu clean
echo ">Build firmware"
cd ~/klipper && make KCONFIG_CONFIG=~/klipper_config/config_lcd_mcu
read -sp ">Insert boot jumper and press reset"
echo ">Flash firmware"
cd ~/klipper && make KCONFIG_CONFIG=~/klipper_config/src/config_lcd_mcu flash FLASH_DEVICE=0483:df11
echo ">Remove boot jumper and press reset"
echo ""
