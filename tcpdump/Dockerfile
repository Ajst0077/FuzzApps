FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt-get -y update && \
    apt-get install -y \
    flex \
    bison && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/the-tcpdump-group/tcpdump.git && \
    git clone https://github.com/the-tcpdump-group/libpcap.git && \
    cp -r tcpdump tcpdump_asan && cp -r libpcap tcpdump/libpcap && \
    cp -r libpcap tcpdump_asan && cd tcpdump/libpcap && autoconf && \
    CC=afl-gcc CXX=afl-g++ ./configure --disable-shared && \
    AFL_HARDEN=1 make && cd .. && autoconf && \
    CC=afl-gcc CXX=afl-g++ ./configure --disable-shared && \
    AFL_HARDEN=1 make && cd ../tcpdump_asan/libpcap && autoconf && \
    ./configure --disable-shared CFLAGS="-g -fsanitize=address" CXXFLAGS="-g -fsanitize=address" && \
    make && cd .. && autoconf && \
    ./configure --disable-shared CFLAGS="-g -fsanitize=address" CXXFLAGS="-g -fsanitize=address" && \
    make 

CMD ["/bin/bash"]
