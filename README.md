# afl_docker_apps
docker environment for fuzzing applications based on afl

## supported applications

- binutils ([skysider/afl_binutils](https://hub.docker.com/r/skysider/afl_binutils/))
- libarchive ([skysider/afl_libarchive](https://hub.docker.com/r/skysider/afl_libarchive/))
- poppler ([skysider/afl_poppler](https://hub.docker.com/r/skysider/afl_poppler/))

## Run

### Example:

```shell
docker run -it --cap-add=SYS_PTRACE -v $(pwd)/corpus/elf:/work/corpus skysider/afl_binutils
root@eb6f1d902221:/work# ls
binutils-gdb binutils-gdb-asan corpus
```
- program in directory binutils-gdb is compiled with afl-gcc and afl-g++, which is used to fuzz
- program in directory binutils-gdb-asan is compile with gcc and g++ with sanitizer flag, which is used to verify crash
- file in directory corpus is used as input of afl-fuzz

## Todo

add more applications
