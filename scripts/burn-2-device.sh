project_name="mobilecar-nucleoG474re-freertos"


rm -rf build
if [ ! -d build ]; then
    mkdir -p build
fi
cd build


if [ "$(uname)" = "Darwin" ]; then
    NUM_CORES=`sysctl -n hw.ncpu`
else
    NUM_CORES=`nproc --all`
fi
if [ -z "$NUM_CORES" ]; then
    NUM_CORES=4
fi

cmake .. -G "Ninja"
ninja -j $NUM_CORES

export openocd_scripts=$OPENOCD_HOME/openocd/scripts
openocd \
    -f $openocd_scripts/interface/stlink.cfg \
    -f $openocd_scripts/target/stm32g4x.cfg \
    -c init \
    -c "reset halt; wait_halt; flash write_image erase ${project_name}.bin 0x08000000;" \
    -c "reset run; shutdown"
