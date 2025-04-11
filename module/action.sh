#!/system/bin/sh

# Definisi variabel
clash="/data/adb/clash"
clash_run="${clash}/run"
clash_pid="${clash_run}/clash.pid"

run_as_su() {
    su -c "$1"
}

stop_service() {
    echo "Service is shutting down"
    run_as_su "${clash}/scripts/clash.iptables disable"
    run_as_su "${clash}/scripts/clash.service stop"
}

start_service() {
    echo "Service is starting, please wait for a moment"
    run_as_su "${clash}/scripts/clash.service start"
    run_as_su "${clash}/scripts/clash.iptables enable"
    echo "Service has started successfully"
    echo "Service is now running with PID: $(cat ${clash_pid})"
}

if [ -f "${clash_pid}" ]; then
    PID=$(cat "${clash_pid}")
    if [ -e "/proc/${PID}" ]; then
        stop_service
    else
        start_service
    fi
else
    start_service
fi