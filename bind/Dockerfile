FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

WORKDIR /work 

RUN apt update && \
    apt install -y \
    net-tools && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://source.isc.org/git/bind9.git && cd bind9 && \
    sed -i "s/named_g_fuzz_named_addr/named_g_fuzz_addr/g" bin/named/fuzz.c && \
    CC=afl-clang-fast CXX=afl-clang-fast++ ./configure \
        --enable-afl --prefix=/work/server \
        --without-openssl --disable-threads && \
    AFL_USE_ASAN=1 make && make install

CMD ["/bin/bash"]

