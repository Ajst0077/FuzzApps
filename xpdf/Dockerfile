FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt-get -y update && \
    apt-get install -y \
    libfreetype6-dev \
    libopenjp2-7-dev \
    liblcms2-dev \
    libjpg-dev \
    libtiff-dev \
    strace \
    ltrace && \
    rm -rf /var/lib/apt/list/*

WORKDIR /work 

RUN wget https://xpdfreader-dl.s3.amazonaws.com/xpdf-4.00.tar.gz && \
    tar xzvf xpdf-4.00.tar.gz && cp -r xpdf-4.00 xpdf-4.00-address

COPY update-poppler*.sh /work/

ENTRYPOINT ["/bin/bash"]
