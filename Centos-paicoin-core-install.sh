#!/bin/bash

if [ "$#" -ne 2 ]
then
	rpcuser=pai
	rpcpassword=paicoin.org
else
	rpcuser=$1
	rpcpassword=$2
fi

PAICOIN_INSTALL_PATH=~/paicoin-org
PAICOIN_DATA_PATH=~/.paicoin
PAICOIN_CONFIG=paicoin.conf

sudo yum upgrade -y
sudo yum -y install epel-release
sudo yum install -y wget tar git curl gcc gcc-c++ make autoconf libtool pkg-config libevent-devel openssl-devel zeromq-devel boost-devel libdb-devel

cd ~/

hostnamectl | grep 'CentOS Linux 7'
if [ $? -eq 0 ]
then
    sudo yum install -y centos-release-scl
    sudo yum install -y devtoolset-8-gcc devtoolset-8-gcc-c++
    source scl_source enable devtoolset-8

    wget https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz
    tar xzf boost_1_67_0.tar.gz
    cd boost_1_67_0
    ./bootstrap.sh
    ./b2 install
    export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
    echo "export LD_LIBRARY_PATH=/usr/local/lib/:\$LD_LIBRARY_PATH" >> ~/.bashrc
fi

cd ~/

wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xzf db-4.8.30.NC.tar.gz
sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30.NC/dbinc/atomic.h
cd db-4.8.30.NC/build_unix
mkdir -p build
BDB_PREFIX=$(pwd)/build
../dist/configure --disable-shared --enable-cxx --with-pic --prefix=$BDB_PREFIX
[ $? -ne 0 ] && echo "configure berkeley-db failed" && exit -1
make install
[ $? -ne 0 ] && echo "make berkeley-db failed" && exit -1

if [[ ! -d "$PAICOIN_INSTALL_PATH" ]]; then
 mkdir -p $PAICOIN_INSTALL_PATH
fi

cd $PAICOIN_INSTALL_PATH

git clone https://github.com/projectpai/paicoin.git
cd paicoin
./autogen.sh
./configure CPPFLAGS="-I${BDB_PREFIX}/include/ -O2" LDFLAGS="-L${BDB_PREFIX}/lib/ -L/usr/local/lib/" --disable-tests
[ $? -ne 0 ] && echo "configure paicoin-core failed" && exit -1
make
[ $? -ne 0 ] && echo "make paicoin-core failed" && exit -1

if [[ ! -d "$PAICOIN_DATA_PATH" ]]; then
 mkdir -p $PAICOIN_DATA_PATH
fi

cd $PAICOIN_DATA_PATH

echo daemon=1 > $PAICOIN_CONFIG
echo rpcuser=$rpcuser >> $PAICOIN_CONFIG
echo rpcpassword=$rpcpassword >> $PAICOIN_CONFIG

if   [ ! $PAICOIN_PATH ];
then
	echo "ADD PAICOIN_PATH = $PAICOIN_INSTALL_PATH/paicoin/src"
	echo "export PAICOIN_PATH=$PAICOIN_INSTALL_PATH/paicoin/src" >> ~/.bashrc
	echo "export PATH=$PAICOIN_INSTALL_PATH/paicoin/src:\$PATH" >> ~/.bashrc

    if [ ! -r ~/.bash_profile ];
    then
        echo "if [ -r ~/.bashrc ] ; then" >> ~/.bash_profile
        echo "   . ~/.bashrc" >> ~/.bash_profile
        echo "fi" >> ~/.bash_profile
    fi
fi

echo ""
echo "Congratulations, Paicoin Core has been installed successfully!"
echo "Start the Paicoin core with command: 'source ~/.bashrc && paicoind'"
echo "rpcuser=$rpcuser rpcpassword=$rpcpassword"
