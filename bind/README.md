# afl_bind

docker environment for fuzzing bind dns server with afl

## Run
```
docker run -it -v $(pwd)/corpus/dns:/work/corpus --name bind \
    --privileged skysider/afl_bind
root@324fcb32343:/work# afl-fuzz -i corpus -o out ./server/
```