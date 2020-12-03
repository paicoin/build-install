# Paicoin Source code build and install

[README](README.md) | [中文文档](README_zh.md)

"Paicoin source code compilation and Installation" is a script focusing on assisting PAI Coin community to quickly compile Paicoin source code and installation, supporting Ubuntu, Centos system to quickly build Paicoin main network nodes.

## 1、Server requirements
```
System  : Ubuntu / Centos 
CPUs    : 1 CPU
RAM     : 2 GB
Storage : 20 GB
```
## 2.1、Paicoin Core Full node wallet installation
### 2.1.1、Ubuntu OS
支持 Ubuntu 16.04LTS / 18.04LTS / 20.04LTS
```
bash <(curl -s -S -L http://paicoin.org/build/Ubuntu-paicoin-core-install.sh)
```

### 2.1.2、Centos OS
支持 Centos 7 / Centos 8
```
bash <(curl -s -S -L http://paicoin.org/build/Centos-paicoin-core-install.sh)
```

## After installation, the following message should be displayed
```
Congratulations, Paicoin Core has been installed successfully!
Start the Paicoin core with command: 'source ~/.bashrc && paicoind'
rpcuser=pai rpcpassword=paicoin.org
```
Note that the first installation needs to be executed first
```
source ~/.bashrc
```
## 2.2、Paicoin Core Full node launch

```
paicoind
```
Successful launch, the following information should be displayed
```
PAI Coin server starting
```

## 3.1、Paicoin CPUMiner installation

### 3.1.1、Ubuntu OS
Support Ubuntu 16.04LTS / 18.04LTS / 20.04LTS
```
bash <(curl -s -S -L http://paicoin.org/build/Ubuntu-paicoin-cpuminer-install.sh)
```

### 3.1.2、Centos OS
Support Centos 7 / Centos 8
```
bash <(curl -s -S -L http://paicoin.org/build/Centos-paicoin-cpuminer-install.sh)
```

## After installation, the following message should be displayed

```
Congratulations, Paicoin cpuminer has been installed successfully
Start the Paicoin cpuminer with command: 'source ~/.bashrc && minerd -a paicoin -o http://127.0.0.1:8566 -u pai -p paicoin.org --coinbase-addr=your_pai_wallet_address --no-stratum &> ~/cpu-miner-output.log &'
You can check the ~/cpu-miner-output.log file to evaluate the performance of the miner.
```

Note that the first installation needs to be executed first
```
source ~/.bashrc
```

## 3.2、Paicoin CPUMiner launch

```
minerd -a paicoin -o http://127.0.0.1:8566 -u pai -p paicoin.org --coinbase-addr=your_pai_wallet_address --no-stratum &> ~/cpu-miner-output.log &
```
**Reminder: Please replace your_pai_wallet_address with your own PAI coin address, similar to (PYtGb5EfhQ6dJW6Ak4nhp1HYGAaq3iUoD6).**
Check the launch of the mining program
```
tail ~/cpu-miner-output.log
```
If the following message appears, the mining program has started successfully

```
[2020-12-02 06:39:46] thread 0: 329147 hashes, 65.33 khash/s
[2020-12-02 06:39:51] thread 0: 326666 hashes, 64.45 khash/s
[2020-12-02 06:39:56] thread 0: 322229 hashes, 66.22 khash/s
```

## Contribute to Paicoin

Paicoin is a free and open source project. We welcome anyone to contribute to its development and progress. If there are any problems during use, you can give us feedback through the following channels.

* commit [issues](https://github.com/paicoin/build-install/issues) feedback.
* communicate with [PaiForum](https://paiforum.com/) .

**Note: We prefer you to give your advise in [issues](https://github.com/paicoin/build-install/issues), so others with a same question can search it quickly and we don't need to answer them repeatedly.**

## Donation

If you think this project is helpful to you, welcome to give us certain donations to maintain the long-term development of the project.

### PAI Coin 

PAI Coin address: 
```
PYtGb5EfhQ6dJW6Ak4nhp1HYGAaq3iUoD6
```
![donate PAI Coin](https://github.com/paicoin/build-install/blob/feature-add-readme/doc/pic/donate-paicoin.png)
