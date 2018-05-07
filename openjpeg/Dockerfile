FROM skysider/afl_base:latest

LABEL maintainer="junchaoluan@gmail.com"

RUN apt-get -y update && \
    apt-get  install -y \
    libz-dev \
    libtiff-dev \
    libpng-dev \
    liblcms2-dev \
    extra-cmake-modules && \
    rm -rf /var/lib/apt/list/*

WORKDIR /work 

RUN git clone https://github.com/uclouvain/openjpeg && \
    cp -r openjpeg openjpeg_address && \
    cp /usr/share/ECM/modules/ECMEnableSanitizers.cmake \
        /usr/share/cmake-*/Modules/

COPY update-openjpeg*.sh /work/

ENTRYPOINT [ "/bin/bash" ]