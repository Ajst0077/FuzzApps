FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

WORKDIR /work 

RUN git clone https://github.com/libarchive/libarchive.git && \
    cp -r libarchive libarchive_address && \ 
    cd libarchive && ./build/autogen.sh && \
    CC=afl-clang CXX=afl-clang ./configure --disable-shared && \
    AFL_HARDEN=1 make && cd ../libarchive_address && \
    ./build/autogen.sh && \
    ./configure --disable-shared -fsanitize=address && \
    make

ENTRYPOINT [ "/bin/bash" ]