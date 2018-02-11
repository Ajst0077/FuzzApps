#!/bin/bash
cd poppler
git pull origin
cmake . \
    -DCMAKE_C_COMPILER=afl-gcc \
    -DCMAKE_CXX_COMPILER=afl-g++ \
    -DCMAKE_C_FLAGS="-fPIC" \
    -DCMAKE_CXX_FLAGS="-fPIC" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DBUILD_SHARED_LIBS=OFF \
    -DENABLE_QT5=OFF \
    -DENABLE_LIBOPENJPEG=openjpeg2 \
    -DENABLE_CMS=lcms2 \
    -DENABLE_SHARED_LIBS=OFF
AFL_HARDEN=1 make
