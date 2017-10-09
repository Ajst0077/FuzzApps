cd poppler_address && git pull origin
cmake . -DCMAKE_C_FLAGS="-g -fsanitize=address -fPIC" -DCMAKE_CXX_FLAGS="-g -fsanitize=address -fPIC" -DBUILD_SHARED_LIBS=OFF
make
