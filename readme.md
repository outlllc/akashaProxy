## akashaProxy

English | [中文](./readme_zh.md)


### Instructions for use

akashaProxy is a Magisk/KernelSU module derived from ~~mihomo~~clashMeta

**Work path: /data/adb/clash/**

`setting.ini` : module startup configuration

`config.yaml.`:clash configuration file

`packages.list` : Black/white list for proxying

 management panel: 127.0.0.1:9090/ui (default)

>Rename config.yaml.example to config.yaml and fill in the configuration file, or use your own configuration file

clash tutorial:
https://wiki.metacubex.one
https://clash-meta.wiki

## Start and stop

start:
````
/data/adb/clash/script/cash.service start && /data/adb/clash/script/clash.iptables enable
````

stop:
````
/data/adb/clash/script/clash.service -stop && /data/adb/clash/script/clash.iptables - disable
````

You can also use [dashboard](https://t.me/MagiskChangeKing) to manage startup and shutdown or KernelSU webUI control

## Compile

Execute `make` to compile and package the module
````
make
````
> The armeabi-v7a architecture and arm64-v8a architecture are built by default under the android platform