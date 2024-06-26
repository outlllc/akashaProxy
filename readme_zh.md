## akashaProxy

中文 | [English](./readme.md)

自用修改工作路径为: /data/adb/clash/**，其余与原版相同
## 模块路径：

**工作路径：/data/adb/clash/**

`clash.config` : 模块启动配置

`clash.yaml` : Clash 配置（全局配置和 dns 配置）

`config.yaml` ：clash配置（其他）

`packages.list` : 进行代理的黑/白名单列表

yacd管理面板：127.0.0.1:9090/ui（默认）

```
├── adguard // AdGuardHome插件核心目录
│   ├── AdGuardHome
├── clashkernel //模块核心目录
│   ├── clashMeta 
├── scripts // 模块启动脚本
│   ├── clash.inotify
│   ├── clash.iptables
│   ├── clash.service
│   └── clash.tool
├── tools
│   ├── DeleteCache.sh // 清除Google系app等缓存
│   ├── DownloadAdGuardHome.sh // 下载安装AdGuardHome插件
│   ├── reload.sh // 重载配置
│   ├── start.sh // 启动模块
│   └── stop.sh // 停止模块
├── yacd
│   ├── // yacd-Meta面板源码
├── run
│   ├── // 模块运行目录
├── bin
│   ├── // 模块内部工具目录
├── GeoSite.dat
├── GeoIP.dat
├── clash.config
├── clash.yaml
├── config.yaml
└── packages.list
```

clash教程：
https://wiki.metacubex.one
https://clash-meta.wiki

## 启动和停止

开始：
````
/data/adb/clash/script/clash.service -s && /data/adb/clash/script/clash.iptables -s
````

停止：
````
/data/adb/clash/script/clash.service -k && /data/adb/clash/script/clash.iptables -k
````

您还可以使用[dashboard](https://t.me/MagiskChangeKing)管理启停

## 编译

执行 `make` 编译并打包模块
````
make
````

## 发布

[Telegram](https://t.me/akashaProxy)
[Github工作流(需要解压)](https://github.com/ModuleList/akashaProxy/actions)
