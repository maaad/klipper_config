echo ">Clean up sources"
cd ~/klipper && make KCONFIG_CONFIG=../klipper_config/src/.config_lcd clean
echo ">Build firmware"
cd ~/klipper && make KCONFIG_CONFIG=../klipper_config/src/.config_lcd 
read -sp ">Insert boot jumper and press reset"
echo ">Flash firmware"
cd ~/klipper && make KCONFIG_CONFIG=.config_lcd flash FLASH_DEVICE=0483:df11
echo ">Remove boot jumper and press reset"
echo ""
