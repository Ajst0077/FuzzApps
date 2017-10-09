# afl_docker_apps
docker environment for fuzzing applications based on afl

## supported applications

- binutils ([skysider/afl_binutils](https://hub.docker.com/r/skysider/afl_binutils/))
- libarchive ([skysider/afl_libarchive](https://hub.docker.com/r/skysider/afl_libarchive/))
- poppler ([skysider/afl_poppler](https://hub.docker.com/r/skysider/afl_poppler/))

## Run

### Example:

```shell
docker run -it --cap-add=SYS_PTRACE -v $(pwd):/work/corpus skysider/afl_binutils
```

## Todo

add more applications