## akashaProxy

English | [中文](./readme_zh.md)


## Module path:

**Work path: /data/adb/clash/**

`clash.config` : module startup configuration

`config.yaml.`:clash configuration file

`packages.list` : Black/white list for proxying

yacd management panel: 127.0.0.1:9090/ui (default)

>Rename config.yaml.example to config.yaml and fill in the configuration file, or use your own configuration file

clash tutorial:
https://wiki.metacubex.one
https://clash-meta.wiki

## Start and stop

start:
````
/data/clash/scripts/clash.service -s && /data/clash/scripts/clash.iptables -s
````

stop:
````
/data/clash/scripts/clash.service -k && /data/clash/scripts/clash.iptables -k
````

You can also use [dashboard](https://t.me/MagiskChangeKing) to manage startup and shutdown or KernelSU webUI control

## Compile

Execute `make` to compile and package the module
````
make
````
> The armeabi-v7a architecture and arm64-v8a architecture are built by default under the android platform

## Publish

[Telegram](https://t.me/akashaProxy)
[Github workflow (requires decompression)](https://github.com/ModuleList/akashaProxy/actions)
