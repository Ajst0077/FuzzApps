FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt update && \
    apt install -y \
    libgnutls-dev \
    liburcu-dev  \
    libedit-dev \
    liblmdb-dev \
    libcap-ng-dev \
    libsystemd-dev \
    libidn11-dev \
    protobuf-c-compiler \
    libfstrm-dev && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://gitlab.labs.nic.cz/knot/knot-dns.git && \
    cd knot-dns && git checkout 2.5 && autoreconf -if && \
    CC=afl-clang-fast ./configure --disable-shared --prefix=/work/server/ --with-sanitize && \
    make check && cd tests-fuzz && \
    wget https://gitlab.labs.nic.cz/knot/knot-dns/uploads/ce47a4b9ff729c9665b8ea1293392380/knot.dummy.conf

CMD ["/bin/bash"]