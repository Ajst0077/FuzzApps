#!/bin/bash
cd binutils-gdb
git pull origin
make distclean
CC=afl-gcc CXX=afl-g++ ./configure --disable-shared
AFL_HARDEN=1 make