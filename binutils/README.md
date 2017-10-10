# afl_binutils
a docker environment for fuzzing libbsd

## Run

```shell
docker run -it --cap-add=SYS_PTRACE --name binutils -v $(pwd)/corpus/elf:/work/courpus skysider/afl_binutils

```

