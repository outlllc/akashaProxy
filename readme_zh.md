## 

中文 | [English](./readme.md)

修改工作路径为: /data/adb/clash/**
## 模块路径：

**工作路径：/data/adb/clash/**

`setting.ini` : 模块启动配置

`config.yaml.` ：clash配置文件

`packages.list` : 进行代理的黑/白名单列表

管理面板：127.0.0.1:9090/ui（默认）

>将config.yaml.example重命名为config.yaml后填写配置文件，或者使用你自己的配置文件

clash教程：
https://wiki.metacubex.one
https://clash-meta.wiki

## 启动和停止

开始
````
/data/adb/clash/script/cash.service start && /data/adb/clash/script/clash.iptables enable
````

停止：
````
/data/adb/clash/script/clash.service -stop && /data/adb/clash/script/clash.iptables - disable
````

您还可以使用[dashboard](https://t.me/MagiskChangeKing)管理启停或者使用KernelSU webUI

## 编译

执行 `make` 编译并打包模块
````
make
````