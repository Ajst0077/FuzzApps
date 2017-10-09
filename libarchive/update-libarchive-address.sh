#!/bin/bash
cd libarchive_address
git pull origin
make distclean
./build/autogen.sh 
./configure --disable-shared CFLAGS="-g -fsanitize=address" CXXFLAGS="-g -fsanitize=address"
make