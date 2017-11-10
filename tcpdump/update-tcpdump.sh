#!/bin/bash
cd tcpdump/libpcap
make clean
git pull origin
CC=afl-gcc CXX=afl-g++ ./configure --disable-shared
AFL_HARDEN=1 make
cd ..
make clean
git pull origin
CC=afl-gcc CXX=afl-g++ ./configure --disable-shared
AFL_HARDEN=1 make
