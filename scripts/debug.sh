project_name="mobilecar-nucleoG474re-freertos"

export openocd_scripts=$OPENOCD_HOME/openocd/scripts


arm-none-eabi-gdb

openocd \
    -f $openocd_scripts/interface/stlink.cfg \
    -f $openocd_scripts/target/stm32g4x.cfg