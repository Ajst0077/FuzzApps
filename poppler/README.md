# afl_poppler
a docker environment for fuzzing poppler

## Run

```shell
docker run -it --name poppler -v $(pwd)/corpus/pdf:/work/corpus skysider/afl_poppler
root@146ad565465# ls
corpus poppler poppler_address update-poppler.sh update-poppler-address.sh
root@146ad565465# afl-cmin -i corpus -o corpus_cmin ./poppler/utils/pdftops @@ 1
root@146ad565465# afl-fuzz -i corpus_cmin -o out ./poppler/utils/pdftops @@ 1

docker exec -it poppler /bin/bash
root@146ad565465# ./poppler_address/utils/pdftops out/crashes/id:000000 1
```

- programs in directory poppler are compiled with afl-gcc and afl-g++, which are used for fuzzing
- programs in directory poppler_address are compiled with gcc and g++ with sanitizer flag, which are used to verify crash
- files in directory corpus are used as input of afl-fuzz
- update-poppler.sh is a script which updates poppler from official repository and recompile poppler with afl compiler
- update-poppler-address.sh does the same as above except that it works for poppler_address with gcc compiler