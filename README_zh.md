# Paicoin 源码编译及安装

[README](README.md) | [中文文档](README_zh.md)

《Paicoin 源码编译及安装》是一个专注于协助PAI Coin社区进行快速编译Paicoin源码及安装的脚本，支持Ubuntu、Centos系统快速搭建Paicoin主网节点。

## 1、服务器配置要求
```
System  : Ubuntu / Centos 
CPUs    : 1 CPU
RAM     : 2 GB
Storage : 20 GB
```
## 2.1、Paicoin Core 完整节点钱包安装
### 2.1.1、Ubuntu 系统
支持 Ubuntu 16.04LTS / 18.04LTS / 20.04LTS
```
bash <(curl -s -S -L http://paicoin.org/build/Ubuntu-paicoin-core-install.sh)
```

### 2.1.2、Centos 系统
支持 Centos 7 / Centos 8
```
bash <(curl -s -S -L http://paicoin.org/build/Centos-paicoin-core-install.sh)
```

## 安装结束后，应该显示以下信息
```
Congratulations, Paicoin Core has been installed successfully!
Start the Paicoin core with command: 'source ~/.bashrc && paicoind'
rpcuser=pai rpcpassword=paicoin.org
```
注意,首次安装需要先执行
```
source ~/.bashrc
```
## 2.2、Paicoin Core 完整节点启动

```
paicoind
```
启动成功，应该显示以下信息
```
PAI Coin server starting
```

## 3.1、Paicoin CPU 挖矿安装

### 3.1.1、Ubuntu 系统
支持 Ubuntu 16.04LTS / 18.04LTS / 20.04LTS
```
bash <(curl -s -S -L http://paicoin.org/build/Ubuntu-paicoin-cpuminer-install.sh)
```

### 3.1.2、Centos 系统
支持 Centos 7 / Centos 8
```
bash <(curl -s -S -L http://paicoin.org/build/Centos-paicoin-cpuminer-install.sh)
```

## 安装结束后，应该显示以下信息

```
Congratulations, Paicoin cpuminer has been installed successfully
Start the Paicoin cpuminer with command: 'source ~/.bashrc && minerd -a paicoin -o http://127.0.0.1:8566 -u pai -p paicoin.org --coinbase-addr=your_pai_wallet_address --no-stratum &> ~/cpu-miner-output.log &'
You can check the ~/cpu-miner-output.log file to evaluate the performance of the miner.
```

注意,首次安装需要先执行
```
source ~/.bashrc
```

## 3.2、Paicoin CPU 挖矿启动

```
minerd -a paicoin -o http://127.0.0.1:8566 -u pai -p paicoin.org --coinbase-addr=your_pai_wallet_address --no-stratum &> ~/cpu-miner-output.log &
```
**提醒：请蒋 your_pai_wallet_address 替换成自己的PAI Coin地址，类似（PYtGb5EfhQ6dJW6Ak4nhp1HYGAaq3iUoD6）。**
检查挖矿程序启动情况
```
tail ~/cpu-miner-output.log
```
如出现以下信息，表示cpu挖矿程序启动成功

```
[2020-12-02 06:39:46] thread 0: 329147 hashes, 65.33 khash/s
[2020-12-02 06:39:51] thread 0: 326666 hashes, 64.45 khash/s
[2020-12-02 06:39:56] thread 0: 322229 hashes, 66.22 khash/s
```

如出现以下信息，表示区块未完成同步，cpu挖矿程序在等待区块链同步结束，这个情况一般等区块同步完成后会正常
```
HTTP request failed: The requested URL returned error: 500 Internal Server Error
json_rpc_call failed, retry after 30 seconds
```

## 为 Paicoin 做贡献

Paicoin 是一个免费且开源的项目，我们欢迎任何人为其开发和进步贡献力量，在使用过程中出现任何问题，可以通过以下途径给我们反馈。

* 提交 [issues](https://github.com/paicoin/build-install/issues) 来反馈。
* 通过 [论坛](https://paiforum.com/) 来反馈。

**提醒：和项目相关的问题最好在 [issues](https://github.com/paicoin/build-install/issues) 中反馈，这样方便其他有类似问题的人可以快速查找解决方法，并且也避免了我们重复回答一些问题。**

## 捐助

如果您觉得本项目对你有帮助，欢迎给予我们一定的捐助来维持项目的长期发展。

### PAI Coin 捐赠

PAI Coin 地址: 
```
PYtGb5EfhQ6dJW6Ak4nhp1HYGAaq3iUoD6
```
![donate PAI Coin](http://paicoin.org/images/paicoin/donate-paicoin.png)

