#!/system/bin/sh
(
    until [ $(getprop init.svc.bootanim) = "stopped" ] ; do
        sleep 10 
    done
    chmod 777 ${scripts_dir}/start.sh
    ${scripts_dir}/start.sh
)&

#if [[ $(magisk -v | grep "delta") ]] || [[ $(magisk -v | grep "kitsune") ]];then
#    echo "">remove
#    exit 1
#fi

service_path=`realpath $0`
module_dir=`dirname ${service_path}`
Clash_data_dir="/data/adb/clash"
scripts_dir="${Clash_data_dir}/scripts"
Clash_run_path="${Clash_data_dir}/run"
Clash_pid_file="${Clash_run_path}/clash.pid"
#. /data/clash/setting.ini
#
#if [ -f ${Clash_pid_file} ] ; then
#    rm -rf ${Clash_pid_file}
#fi
#crond -c ${Clash_run_path}
#chmod -R 6755 ${Clash_data_dir}/bin
#if [ ${self_start} == "true" ] ; then
#    nohup ${scripts_dir}/clash.service -s && ${scripts_dir}/clash.iptables -s
#fi
