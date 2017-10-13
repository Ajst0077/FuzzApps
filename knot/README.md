# afl_knot
docker environment for fuzzing knot dns server with afl

## Run
```
docker run -it --name knot-dns --privileged -v $(pwd)/corpus/dns:/work/corpus -v $(pwd)/dns_out:/work/out skysider/afl_knot

root@1c49112bb61d:/work# cd knot-dns

root@1c49112bb61d:/work/knot-dns# LD_LIBRARY_PATH=./src/.libs:./src/dnssec/.libs:./src/zscanner/.libs afl-cmin -i ../corpus -o ../corpus_cmin -- ./tests-fuzz/packet

root@1c49112bb61d:/work/knot-dns# LD_LIBRARY_PATH=./src/.libs:./src/dnssec/.libs:./src/zscanner/.libs afl-fuzz -m 1000M -i ../corpus_cmin -o ../out -- ./tests-fuzz/knotd_stdio -c ./tests-fuzz/knot.dummy.conf
```

## Reference
- https://gitlab.labs.nic.cz/knot/knot-dns/wikis/Fuzzing