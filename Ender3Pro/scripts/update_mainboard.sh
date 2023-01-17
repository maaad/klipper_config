echo ">Clean up sources"
cd ~/klipper && make KCONFIG_CONFIG=../klipper_config/src/.config_pico clean
echo ">Build firmware"
cd ~/klipper && make KCONFIG_CONFIG=../klipper_config/src/.config_pico 
read -sp ">Insert boot jumper, press reset and connect Pico to PC..."
echo ""
read -sp ">Upload /home/pi/klipper/out/klipper.uf2 to Pico"
echo ""
echo ">Remove boot jumper and press reset"
