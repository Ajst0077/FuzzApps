FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt-get -y update && \
    apt-get install -y \
    git \
    texinfo \
    texi2html \
    bison \
    flex

WORKDIR /work 

RUN git clone --depth=1 git://sourceware.org/git/binutils-gdb.git && \
    cp -r binutils-gdb binutils-gdb-asan && cd binutils-gdb && \
    CC=afl-gcc CXX=afl-g++ ./configure --disable-shared && \
    AFL_HARDEN=1 make && cd ../binutils-gdb-asan && \
    ./configure --disable-shared CFLAGS="-g -fsanitize=address" CXXFLAGS="-g -fsanitize=address" LIBS=-ldl LDFLAGS=-ldl && \
    make

COPY update-binutils*.sh /work/

ENTRYPOINT [ "/bin/bash" ]