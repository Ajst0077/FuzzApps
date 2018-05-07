#!/bin/bash
cd poppler_address
git pull origin
cmake . \
    -DCMAKE_BUILD_TYPE=Debug \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_DISABLE_FIND_PACKAGE_Qt5Widgets=1 \
    -DCMAKE_DISABLE_FIND_PACKAGE_Qt4=1 \
    -DCMAKE_C_FLAGS="-g -fno-omit-frame-pointer -fsanitize=address" \
    -DCMAKE_CXX_FLAGS="-g -fno-omit-frame-pointer -fsanitize=address" \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++
make
