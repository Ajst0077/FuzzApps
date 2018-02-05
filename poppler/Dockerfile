FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt-get -y update && \
    apt-get install -y \
    libopenjpeg-dev \
    libjpeg-dev \
    libopenjpeg-2-7-dev \
    libnss3-dev \
    liblcms2-dev \
    libcairo2-dev \
    pkg-config \
    libfontconfig1-dev \
    gtk-doc-tools \
    shtool \
    cmake && \
    rm -rf /var/lib/apt/list/*

WORKDIR /work 

RUN git clone https://anongit.freedesktop.org/git/poppler/poppler.git && \
    cp -r poppler poppler_address && cd poppler 

COPY update-poppler*.sh /work/

ENTRYPOINT ["/bin/bash"]
