#!/bin/bash
cd poppler_address
git pull origin
cmake . \
    -DCMAKE_BUILD_TYPE=debugfull \
    -DENABLE_QT5=OFF \
    -DENABLE_LIBOPENJPEG=openjpeg2 \
    -DENABLE_CMS=lcms2 \
    -DECM_ENABLE_SANTIZERS='address'
    -DBUILD_SHARED_LIBS=OFF
make
