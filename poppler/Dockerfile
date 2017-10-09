FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt-get -y update && \
    apt-get install -y \
    libopenjpeg-dev \
    libjpeg-dev \
    pkg-config \
    libfontconfig1-dev \
    gtk-doc-tools \
    shtool \
    cmake && \
    rm -rf /var/lib/apt/list/*

WORKDIR /work 

RUN git clone https://anongit.freedesktop.org/git/poppler/poppler.git && \
    cp -r poppler poppler_address && cd poppler && \
    cmake . \
        -DCMAKE_C_COMPILER=afl-gcc \
        -DCMAKE_CXX_COMPILER=afl-g++ \
        -DCMAKE_C_FLAGS="-fPIC" \
        -DCMAKE_CXX_FLAGS="-fPIC" \
        -DBUILD_SHARED_LIBS=OFF && \ 
    AFL_HARDEN=1 make && \
    cd ../poppler_address/ && \
    cmake . -DCMAKE_C_FLAGS="-g -fsanitize=address -fPIC" -DCMAKE_CXX_FLAGS="-g -fsanitize=address -fPIC" -DBUILD_SHARED_LIBS=OFF && \
    make

COPY update-poppler*.sh /work/

ENTRYPOINT ["/bin/bash"]