## akashaProxy

中文 | [English](./readme.md)

自用修改工作路径为: /data/adb/clash/**，其余与原版相同
## 模块路径：

**工作路径：/data/adb/clash/**

`clash.config` : 模块启动配置

`config.yaml.` ：clash配置文件

`packages.list` : 进行代理的黑/白名单列表

yacd管理面板：127.0.0.1:9090/ui（默认）

>将config.yaml.example重命名为config.yaml后填写配置文件，或者使用你自己的配置文件

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

您还可以使用[dashboard](https://t.me/MagiskChangeKing)管理启停 Or KernelSU’s webUI control

## 编译

执行 `make` 编译并打包模块
````
make
````

## 发布

[Telegram](https://t.me/akashaProxy)
[Github工作流(需要解压)](https://github.com/ModuleList/akashaProxy/actions)
