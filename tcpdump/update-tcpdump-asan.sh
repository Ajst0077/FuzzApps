#!/bin/bash
cd tcpdump/libpcap
make clean
git pull origin
./configure --disable-shared CFLAGS="-g -fsanitize=address" CXXFLAGS="-g -fsanitize=address"
make
cd ..
make clean
git pull origin
./configure --disable-shared CFLAGS="-g -fsanitize=address" CXXFLAGS="-g -fsanitize=address"
make
