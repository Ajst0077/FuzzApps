#!/bin/bash
cd bind9
git pull origin
rm -rf /work/server/
sed -i "s/named_g_fuzz_named_addr/named_g_fuzz_addr/g" bin/named/fuzz.c
./configure CFLAGS="-g -fsanitize=address" \
    --prefix=/work/server \
    --without-openssl --disable-threads
make clean
make
make install