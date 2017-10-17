# afl_openssl
docker environment for fuzzing openssl with afl

## Run
```
docker run -it -v $(pwd)/openssl_out:/work/out \
--privileged --name openssl skysider/afl_openssl
root@ab6f314e2b8e:/work# cd openssl
root@ab6f314e2b8e:/work# FUZZER=client
root@ab6f314e2b8e:/work# afl-fuzz -i fuzz/corpora/$FUZZER -o fuzz/corpora/$FUZZER/out fuzz/$FUZZER
```

```
docker exec -it openssl /bin/bash
root@ab6f314e2b8e:/work# 
```