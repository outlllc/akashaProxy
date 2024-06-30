#!/system/bin/sh

moddir="/data/adb/modules/Clash_For_Magisk"
if [[ $(magisk -v | grep "delta") ]] && [[ $(magisk -v | grep "kitsune") ]];then
    echo "">remove
    exit 1
fi

service_path=`realpath $0`
module_dir=`dirname ${service_path}`
data_dir="/data/adb/clash"
scripts_dir="${data_dir}/scripts"
Clash_data_dir="/data/adb/clash"
Clash_run_path="${Clash_data_dir}/run"
Clash_pid_file="${Clash_run_path}/clash.pid"

start_service() {
    ${scripts_dir}/clash.service -s
    if [ -f ${Clash_pid_file} ]
    then
        ${scripts_dir}/clash.iptables -s
    fi
}

start_clash() {
if [ -f ${Clash_pid_file} ]
then
    ${scripts_dir}/clash.service -k && ${scripts_dir}/clash.iptables -k
fi
}

start_run() {
if [ ! -f /data/adb/clash/manual ]
then
    echo -n "" > /data/adb/clash/run/service.log
    if [ ! -f ${moddir}/disable ]
    then
        start_service
    fi
    if [ "$?" = 0 ]
    then
       ulimit -SHn 1000000
       inotifyd ${scripts_dir}/clash.inotify ${moddir} &>> /dev/null &
    fi
fi
}

start_clash
start_run
