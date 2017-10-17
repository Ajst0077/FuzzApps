FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

WORKDIR /work 

RUN cpan -i Text::Template && \
    git clone git://git.openssl.org/openssl.git && cd openssl && \
    CC=afl-clang-fast ./config enable-fuzz-afl no-shared -DPEDANTIC \
        enable-tls1_3 enable-weak-ssl-ciphers enable-rc5 enable-md2 \
        enable-ssl3 enable-ssl3-method enable-nextprotoneg \
        enable-ec_nistp_64_gcc_128 -fno-sanitize=alignment \
        --debug && \
    make

CMD ["/bin/bash"]