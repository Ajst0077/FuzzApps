#!/bin/bash
cd libarchive
git pull origin
make distclean
./build/autogen.sh 
CC=afl-clang CXX=afl-clang ./configure --disable-shared
AFL_HARDEN=1 make