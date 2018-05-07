#!/bin/bash
cd openjpeg
git pull origin
cmake . \
    -DCMAKE_C_FLAGS="-fPIC" \
    -DCMAKE_CXX_FLAGS="-fPIC" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DBUILD_SHARED_LIBS=OFF \
    -DECM_ENABLE_SANTIZERS='address;leak;undefined'

make