#!/system/bin/sh
Clash_data_dir="/data/adb/clash"

rm_data() {
    rm -rf ${Clash_data_dir}
    rm -rf ${Clash_data_dir}.old

    if [ -f "/data/adb/ksu/service.d/clash_service.sh" ]; then
        rm -rf "/data/adb/ksu/service.d/clash_service.sh"
    fi
    
    if [ -f "/data/adb/service.d/clash_service.sh" ]; then
        rm -rf "/data/adb/service.d/clash_service.sh"
    fi
}

rm_data
