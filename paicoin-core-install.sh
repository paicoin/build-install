#!/bin/bash

if [ "$#" -ne 2 ]
then
	rpcuser=pai
	rpcpassword=paicoin.org
else
	rpcuser=$1
	rpcpassword=$2
fi

PAICOIN_INSTALL_PATH=/usr/paicoin-org
PAICOIN_DATA_PATH=/root/.paicoin
PAICOIN_CONFIG=paicoin.conf

apt-get update -y
apt-get install -y curl build-essential autoconf libtool pkg-config bsdmainutils checkinstall libevent-dev libssl-dev libzmq5-dev \
      libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-thread-dev libboost-test-dev \
      libdb-dev libdb++-dev

if [[ ! -d "$PAICOIN_INSTALL_PATH" ]]; then
 mkdir $PAICOIN_INSTALL_PATH
fi
cd $PAICOIN_INSTALL_PATH

curl -L http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz -o db-4.8.30.NC.tar.gz
tar -xvf db-4.8.30.NC.tar.gz
sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30.NC/dbinc/atomic.h
cd db-4.8.30.NC/build_unix
mkdir -p build
BDB_PREFIX=$(pwd)/build
../dist/configure --disable-shared --enable-cxx --with-pic --prefix=$BDB_PREFIX
make install

cd $PAICOIN_INSTALL_PATH

git clone https://github.com/projectpai/paicoin.git
cd paicoin
./autogen.sh
./configure CPPFLAGS="-I${BDB_PREFIX}/include/ -O2" LDFLAGS="-L${BDB_PREFIX}/lib/" --disable-tests
make

if [[ ! -d "$PAICOIN_DATA_PATH" ]]; then
 mkdir $PAICOIN_DATA_PATH
fi

cd $PAICOIN_DATA_PATH

echo daemon=1 > $PAICOIN_CONFIG
echo rpcuser=$rpcuser >> $PAICOIN_CONFIG
echo rpcpassword=$rpcpassword >> $PAICOIN_CONFIG

if   [ ! $PAICOIN_PATH ];  
then  
	echo "ADD PAICOIN_PATH = $PAICOIN_INSTALL_PATH/paicoin/src"  
	echo export PAICOIN_PATH=$PAICOIN_INSTALL_PATH/paicoin/src >> /etc/profile
	echo export PATH=$PAICOIN_INSTALL_PATH/paicoin/src:$PATH >> /etc/profile
fi 

source /etc/profile

echo "Congratulations, Paicoin Core has been installed successfully！"
echo "Start the Paicoin core with command: paicoind"
echo "rpcuser=$rpcuser rpcpassword=$rpcpassword"


