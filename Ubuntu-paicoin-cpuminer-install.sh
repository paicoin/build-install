#!/bin/bash

PAICOIN_INSTALL_PATH=~/paicoin-org

sudo apt-get update -y

sudo apt install -y libcurl4-gnutls-dev

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

if   [ ! $PAIMINER_PATH ];
then
	echo "ADD PAIMINER_PATH = $PAICOIN_INSTALL_PATH/cpuminer"
	echo "export PAIMINER_PATH=$PAICOIN_INSTALL_PATH/cpuminer" >> ~/.bashrc
	echo "export PATH=$PAICOIN_INSTALL_PATH/cpuminer:\$PATH" >> ~/.bashrc

    if [ ! -f ~/.bash_profile ];
    then
        echo "if [ -r ~/.bashrc ] ; then" >> ~/.bash_profile
        echo "   . ~/.bashrc" >> ~/.bash_profile
        echo "fi" >> ~/.bash_profile
    fi
fi

echo ""
echo "Congratulations, Paicoin cpuminer has been installed successfully"
echo "Start the Paicoin cpuminer with command: 'source ~/.bashrc && minerd -a paicoin -o http://127.0.0.1:8566 -u pai -p paicoin.org --coinbase-addr=your_pai_wallet_address --no-stratum &> ~/cpu-miner-output.log &'"
echo "You can check the ~/cpu-miner-output.log file to evaluate the performance of the miner."
