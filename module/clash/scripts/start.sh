#!/system/bin/sh

moddir="/data/adb/modules/Clash_For_Magisk"
if [[ $(magisk -v | grep "delta") ]] && [[ $(magisk -v | grep "kitsune") ]];then
    echo "">remove
    exit 1
fi
# busybox Magisk/KSU/Apatch
busybox="/data/adb/magisk/busybox"
[ -f "/data/adb/ksu/bin/busybox" ] && busybox="/data/adb/ksu/bin/busybox"
[ -f "/data/adb/ap/bin/busybox" ] && busybox="/data/adb/ap/bin/busybox"

service_path=`realpath $0`
module_dir=`dirname ${service_path}`
data_dir="/data/adb/clash"
scripts_dir="${data_dir}/scripts"
Clash_data_dir="/data/adb/clash"
Clash_run_path="${Clash_data_dir}/run"
Clash_pid_file="${Clash_run_path}/clash.pid"


#scripts_dir="${0%/*}"

refresh_clash() {
  if [ -f "/data/adb/clash/run/clash.pid" ]; then
    "${scripts_dir}/clash.service" stop >> "/dev/null" 2>&1
    "${scripts_dir}/clash.iptables" disable >> "/dev/null" 2>&1
  fi
}

start_service() {
  if [ ! -f "${moddir}/disable" ]; then
    "${scripts_dir}/clash.service" start >> "/dev/null" 2>&1
  fi
}

enable_iptables() {
  PIDS=("clash")
  PID=""
  i=0
  while [ -z "$PID" ] && [ "$i" -lt "${#PIDS[@]}" ]; do
    PID=$($busybox pidof "${PIDS[$i]}")
    i=$((i+1))
  done

  if [ -n "$PID" ]; then
    "${scripts_dir}/clash.iptables" enable >> "/dev/null" 2>&1
  fi
}

net_inotifyd() {
  while [ ! -f /data/misc/net/rt_tables ] ; do
    sleep 3
  done

  net_dir="/data/misc/net"
  # Use inotifyd to monitor write events in the /data/misc/net directory for network changes, perhaps we have a better choice of files to monitor (the /proc filesystem is unsupported) and cyclic polling is a bad solution
  inotifyd "${scripts_dir}/clashnet.inotify" "${net_dir}" > "/dev/null" 2>&1 &
}

start_inotifyd() {
  PIDs=($($busybox pidof inotifyd))
  for PID in "${PIDs[@]}"; do
    if grep -q -e "clash.inotify" -e "clashnet.inotify" "/proc/$PID/cmdline"; then
      kill -9 "$PID"
    fi
  done
  inotifyd "${scripts_dir}/clash.inotify" "${moddir}" > "/dev/null" 2>&1 &
  net_inotifyd
}

mkdir -p /data/adb/clash/run/
if [ -f "/data/adb/boxclash/manual" ]; then
  if [ -f "/data/adb/clash/run/clash.pid" ]; then
      rm /data/adb/clash/run/clash.pid
  fi
  net_inotifyd
  exit 1
fi

if [ ! -f ${Clash_data_dir}/manual ] && [ ! -f ${moddir}/disable ] ; then
  refresh_clash
  start_service
  enable_iptables
fi

start_inotifyd
