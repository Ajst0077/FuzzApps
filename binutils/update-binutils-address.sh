#!/bin/bash
cd binutils-gdb-asan
git pull origin
make distclean
./configure --disable-shared CFLAGS="-g -fsanitize=address" CXXFLAGS="-g -fsanitize=address" LIBS=-ldl LDFLAGS=-ldl
make
