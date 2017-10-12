# afl_bind

docker environment for fuzzing bind dns server with afl

## Run
```
docker run -it -v $(pwd)/corpus/dns:/work/corpus -v $(pwd)/dns_out:/work/out \
    --name bind --privileged skysider/afl_bind
root@dfde8d99f428:/work# afl-cmin -i corpus -o corpus_cmin \
    ./server/sbin/named -c ./server/etc/named.conf -A client:127.0.0.1:53 -g 
root@dfde8d99f428:/work# afl-fuzz -i corpus_cmin -o out \
    ./server/sbin/named -c ./server/etc/named.conf -A client:127.0.0.1:53 -g
```