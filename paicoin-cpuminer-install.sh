#!/bin/bash

PAICOIN_INSTALL_PATH=/usr/paicoin-org

apt-get update -y

sudo apt install libcurl4-gnutls-dev

if [[ ! -d "$PAICOIN_INSTALL_PATH" ]]; then
 mkdir $PAICOIN_INSTALL_PATH
fi
cd $PAICOIN_INSTALL_PATH

git clone https://github.com/projectpai/paicoin.git
cd cpuminer
./autogen.sh
./nomacro.pl
./configure CFLAGS="-O3"
make

echo "Congratulations, Paicoin cpuminer has been installed successfully！"
echo "Start the Paicoin cpuminer with command: .$PAICOIN_INSTALL_PATH/cpuminer/minerd -a paicoin -o http://127.0.0.1:8566 -u pai -p paicoin.org --coinbase-addr=PbFAf8gtw5b3XEnoigehb7pZNG2eJ6sBG7 --no-stratum "


