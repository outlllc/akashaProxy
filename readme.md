## akashaProxy

[中文](./readme_zh.md) | English


## Module path:

**Work path: /data/adb/clash/**

`clash.config` : Module start config

`clash.yaml` : Clash config(global configuration and dns configuration)

`config.yaml` : Clash config(other)

`packages.list` : proxy black/white list packages list

Admin panel: 127.0.0.1:9090/ui (default)


```
├── adguard // AdGuardHome bin dir
│   ├── AdGuardHome
├── clashkernel // Kernel bin dir
│   ├── clashMeta 
├── scripts // Module startup script
│   ├── clash.inotify
│   ├── clash.iptables
│   ├── clash.service
│   └── clash.tool
├── tools
│   ├── DeleteCache.sh // Clear cache of Google apps and other apps
│   ├── DownloadAdGuardHome.sh // Download and install the AdGuardHome plugin
│   ├── reload.sh // reload config file
│   ├── start.sh // Start module
│   └── stop.sh // Stop module
├── yacd
│   ├── // yacd-Meta Panel source
├── run
│   ├── // Module running dir
├── bin
│   ├── // Module internal tool dir
├── GeoSite.dat
├── GeoIP.dat
├── clash.config
├── clash.yaml
├── config.yaml
└── packages.list
```

clashMeta Tutorial:
https://wiki.metacubex.one
https://clash-meta.wiki

## start and stop

start:
```
/data/clash/script/clash.service -s && /data/clash/script/clash.iptables -s
```

stop:
```
/data/clash/script/clash.service -k && /data/clash/script/clash.iptables -k
```

You can also use [dashboard](https://t.me/MagiskChangeKing)

## build

run `make` Compile and package the module
```
make
```

## release

[Telegram](https://t.me/akashaProxy)
[Github Action(Need to decompress)](https://github.com/ModuleList/akashaProxy/actions)
