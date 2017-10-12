# afl_bind_verify

docker environment for verifying bind dns server crashes

## Run
```
docker run -it -v $(pwd)/dns_out:/work/out \
    --name bind_verify --privileged skysider/afl_bind
root@dfde8d99f428:/work# ./server/sbin/named -c ./server/etc/named.conf -g 
```
```
docker exec -it bind_verify /bin/bash
root@dfde8d99f428:/work# nc -u 127.0.0.1 53 < out/crashes/id:00000
```