#!/bin/bash
cd poppler
git pull origin
cmake . \
    -DCMAKE_C_COMPILER=afl-gcc \
    -DCMAKE_CXX_COMPILER=afl-g++ \
    -DCMAKE_BUILD_TYPE=Debug \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_DISABLE_FIND_PACKAGE_Qt5Widgets=1 \
    -DCMAKE_DISABLE_FIND_PACKAGE_Qt4=1
AFL_HARDEN=1 make
