FROM phusion/baseimage:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt-get -y update && apt-get install -y \
    wget \
	git \
    make \
	gcc \
	g++ \
    gdb \
    clang-4.0 \
	llvm-4.0 \
	automake \
	libtool \
	pkg-config \
	cmake \
    python-pip && \
	update-alternatives --install /usr/bin/clang clang /usr/bin/clang-4.0 60 \
	--slave /usr/bin/clang++ clang++ /usr/bin/clang++-4.0 \
	--slave /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-4.0 && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /work 

RUN wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz && \
	tar xzvf afl-latest.tgz && \
	cd afl-* && make && \
	cd llvm_mode && make && cd .. && make install \
	cp ../afl-clang-fast ../afl-clang-fast++ /usr/local/bin && \
	cd ../../ && rm -rf afl-*