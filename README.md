# afl_docker_apps
docker environment for fuzzing applications based on afl

## supported applications

- binutils ([skysider/afl_binutils](https://hub.docker.com/r/skysider/afl_binutils/))
- libarchive ([skysider/afl_libarchive](https://hub.docker.com/r/skysider/afl_libarchive/))
- poppler ([skysider/afl_poppler](https://hub.docker.com/r/skysider/afl_poppler/))

## Run

### Example:

```shell
docker run -it --cap-add=SYS_PTRACE -v $(pwd)/corpus/elf:/work/corpus --name binutils skysider/afl_binutils
root@eb6f1d902221:/work# ls
binutils-gdb binutils-gdb-asan corpus
root@eb6f1d902221:/work# afl-cmin -i corpus -o corpus_cmin ./binutils-gdb/build/binutils/objdump -x @@
root@eb6f1d902221:/work# afl-fuzz -i corpus_cmin -o out ./binutils-gdb/build/binutils/objdump -x @@


docker exec -it binutils /bin/bash
root@eb6f1d902221:/work# ./binutils-gdb-asan/build/binutils/objdump out/crashes/id:0000000
```
- programs in directory binutils-gdb are compiled with afl-gcc and afl-g++, which are used for fuzzing
- programs in directory binutils-gdb-asan are compiled with gcc and g++ with sanitizer flag, which are used to verify crash
- files in directory corpus are used as input of afl-fuzz

## Todo

add more applications
