#!/bin/bash
cd bind9
git pull origin
sed -i "s/named_g_fuzz_named_addr/named_g_fuzz_addr/g" bin/named/fuzz.c
rm -rf /work/server/
CC=afl-clang-fast CXX=afl-clang-fast++ ./configure \
        --enable-afl --prefix=/work/server \
        --without-openssl --disable-threads
make clean
AFL_HARDEN=1 make
make install