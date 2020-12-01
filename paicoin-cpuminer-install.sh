#!/bin/bash

PAICOIN_INSTALL_PATH=~/paicoin-org

sudo apt-get update -y

sudo apt install libcurl4-gnutls-dev

if [[ ! -d "$PAICOIN_INSTALL_PATH" ]]; then
    mkdir -p $PAICOIN_INSTALL_PATH
fi
cd $PAICOIN_INSTALL_PATH

git clone https://github.com/projectpai/cpuminer.git
cd cpuminer
./autogen.sh
./nomacro.pl
./configure CFLAGS="-O3"
make

echo ""
echo "Congratulations, Paicoin cpuminer has been installed successfully"
echo "Start the Paicoin cpuminer with command: cd $PAICOIN_INSTALL_PATH/cpuminer && ./minerd -a paicoin -o http://127.0.0.1:8566 -u pai -p paicoin.org --coinbase-addr=your_pai_wallet_address --no-stratum &> ~/cpu-miner-output.log &"
echo "You can check the ~/cpu-miner-output.log file to evaluate the performance of the miner."