FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

WORKDIR /work 

RUN apt update && \
    apt install -y \
    net-tools \
    netcat && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://source.isc.org/git/bind9.git && cd bind9 && \
    sed -i "s/named_g_fuzz_named_addr/named_g_fuzz_addr/g" bin/named/fuzz.c && \
    ./configure CFLAGS="-g -fsanitize=address" \
        --prefix=/work/server \
        --without-openssl --disable-threads && \
    make && make install

COPY named.conf test.zone /work/server/etc/

COPY update-bind.sh /work/

CMD ["/bin/bash"]

