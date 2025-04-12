#!/system/bin/sh

MIN_KSU_VERSION=11563
MIN_KSUD_VERSION=11563
MIN_MAGISK_VERSION=26402


# Check installation conditions
if [ "$BOOTMODE" != true ]; then
  abort "-----------------------------------------------------------"
  ui_print "! Please install in Magisk/KernelSU/APatch Manager"
  ui_print "! Install from recovery is NOT supported"
  abort "-----------------------------------------------------------"
elif [ "$KSU" = true ] && [ "$KSU_VER_CODE" -lt 10670 ]; then
  abort "-----------------------------------------------------------"
  ui_print "! Please update your KernelSU and KernelSU Manager"
  abort "-----------------------------------------------------------"
fi

service_dir="/data/adb/service.d"
if [ "$KSU" = "true" ]; then
  ui_print "- KernelSU version: $KSU_VER ($KSU_VER_CODE)"
  [ "$KSU_VER_CODE" -lt 10683 ] && service_dir="/data/adb/ksu/service.d"
elif [ "$APATCH" = "true" ]; then
  APATCH_VER=$(cat "/data/adb/ap/version")
  ui_print "- APatch version: $APATCH_VER"
else
  ui_print "- Magisk version: $MAGISK_VER ($MAGISK_VER_CODE)"
fi

## Set up service directory and clean old installations
#mkdir -p "${service_dir}"
#if [ -d "/data/adb/modules/Clash_For_Magisk" ]; then
#  rm -rf "/data/adb/modules/Clash_For_Magisk"
#  ui_print "- Old module deleted."
#fi

system_gid="1000"
system_uid="1000"
clash_data_dir="/data/adb/clash"
ABI=$(getprop ro.product.cpu.abi)
mkdir -p ${clash_data_dir}/run
mkdir -p ${clash_data_dir}/bin

if [ ! -f ${clash_data_dir}/bin/mihomo ];then
    unzip -o "$ZIPFILE" 'bin/*' -d "$TMPDIR" >&2
    if [ -f "${MODPATH}/bin/clashMeta-android-${ABI}.tar.bz2" ];then
        tar -xjf ${MODPATH}/bin/clashMeta-android-${ABI}.tar.bz2 -C ${clash_data_dir}/bin/
        mv -f ${clash_data_dir}/bin/clashMeta-android-${ABI} ${clash_data_dir}/bin/mihomo
    else
        if [ -f "${MODPATH}/bin/clashMeta-android-default.tar.bz2" ];then
            tar -xjf ${MODPATH}/bin/clashMeta-android-${ABI}.tar.bz2 -C ${clash_data_dir}/bin/
            mv -f ${clash_data_dir}/bin/clashMeta-android-${ABI} ${clash_data_dir}/bin/mihomo
        else
            ui_print "未找到架构: ${ABI}"
            abort "请使用 “make default” 为${ABI}架构编译mihomo"
        fi
    fi
fi

unzip -o "${ZIPFILE}" -x 'META-INF/*' -d ${MODPATH} >&2
unzip -o "${ZIPFILE}" -x 'clash/*' -d ${MODPATH} >&2

if [ -f "${clash_data_dir}/packages.list" ];then
        ui_print "- packages.list 文件已存在 跳过覆盖."
        rm -rf ${MODPATH}/clash/packages.list
fi

if [ -f "${clash_data_dir}/setting.ini" ];then
    mode=$(grep -i "^mode" ${clash_data_dir}/setting.ini | awk -F '=' '{print $2}' | sed "s/\"//g")
    oldVersion=$(grep -i "version" ${clash_data_dir}/setting.ini | awk -F '=' '{print $2}' | sed "s/\"//g")
    newVersion=$(grep -i "version" ${MODPATH}/clash/setting.ini | awk -F '=' '{print $2}' | sed "s/\"//g")
    if [ "${oldVersion}" < "${newVersion}" ] && [ ! "${oldVersion}" == "" ];then
        ui_print "- setting.ini 文件已存在 跳过覆盖."
        rm -rf ${MODPATH}/clash/setting.ini
    else
        sed -i "s/global/${mode}/g" ${MODPATH}/clash/setting.ini
        cp -Rf ${clash_data_dir}/setting.ini ${clash_data_dir}/setting.ini.old
    fi
fi

if [ "$(pm list packages | grep com.dashboard.kotlin)" == ""];then
    pm install -r ${MODPATH}/apk/DashBoard.apk
fi
unzip -j -o "$ZIPFILE" 'uninstall.sh' -d "$MODPATH" >&2
unzip -j -o "$ZIPFILE" 'clash_service.sh' -d "${service_dir}" >&2
cp -Rf ${MODPATH}/clash/* ${clash_data_dir}/
rm -rf ${MODPATH}/clash
rm -rf ${MODPATH}/apk
rm -rf ${MODPATH}/bin
rm -rf ${MODPATH}/clash_service.sh

ui_print "- 开始设置权限."
set_perm_recursive ${MODPATH} 0 0 0770 0770
set_perm_recursive ${service_dir}/clash_service.sh 0 0 0755 0700
set_perm_recursive ${clash_data_dir} ${system_uid} ${system_gid} 0770 0770
set_perm_recursive ${clash_data_dir}/scripts ${system_uid} ${system_gid} 0770 0770
set_perm_recursive ${clash_data_dir}/mosdns ${system_uid} ${system_gid} 0770 0770
set_perm_recursive ${clash_data_dir}/adguard ${system_uid} ${system_gid} 0770 0770
set_perm_recursive ${clash_data_dir}/tools ${system_uid} ${system_gid} 0770 0770
set_perm_recursive ${clash_data_dir}/bin ${system_uid} ${system_gid} 6770 6770
set_perm  ${clash_data_dir}/mosdns/mosdns  ${system_uid}  ${system_gid}  6770
set_perm  ${clash_data_dir}/adguard/AdGuardHome  ${system_uid}  ${system_gid}  6770
set_perm  ${clash_data_dir}/bin/mihomo  ${system_uid}  ${system_gid}  6770
set_perm  ${clash_data_dir}/setting.ini ${system_uid} ${system_gid} 0770
set_perm  ${clash_data_dir}/packages.list ${system_uid} ${system_gid} 0770


ui_print "
************************************************
个人修改，与原版有差异
************************************************
"
