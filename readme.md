##akashaProxy

[Chinese](./readme_zh.md) | [English]


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
/data/clash/script/clash.service -s && /data/clash/script/clash.iptables -s
````

stop:
````
/data/clash/script/clash.service -k && /data/clash/script/clash.iptables -k
````

You can also use [dashboard](https://t.me/MagiskChangeKing) to manage startup and shutdown or KernelSU webUI control

## Compile

Execute `make` to compile and package the module
````
make
<<<<<<< HEAD
```
=======
````
> The armeabi-v7a architecture and arm64-v8a architecture are built by default under the android platform
>>>>>>> upstream/master

## Publish

[Telegram](https://t.me/akashaProxy)
[Github workflow (requires decompression)](https://github.com/ModuleList/akashaProxy/actions)
