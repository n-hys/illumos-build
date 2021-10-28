# A Docker container for building illumos porting

See https://github.com/n-hys/illumos-gate/wiki

## How to build the illumos in docker container

### In the linux shell
#### Clone repository
```
git clone -b osport/v2021.07 --recursive https://github.com/n-hys/illumos-gate.git
```

#### Create a output directory
```
mkdir data
```

#### Run docker container
```
docker run -it --rm -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
    -u $(id -u $USER):$(id -g $USER) \
    -v `pwd`/illumos-gate:"$HOME"/illumos-gate -v `pwd`/data:/data \
    ghcr.io/n-hys/illumos-build:main bash
```

### In the docker container
#### Build illumos for aarch64
```
rm -rf /data/proto/root_aarch64/* /tmp/solaris/  && \
    make -C "$HOME"/illumos-gate/usr/src tools && \
    make -C "$HOME"/illumos-gate/usr/src clobber -j MACH=aarch64 && \
    time make -C "$HOME"/illumos-gate/usr/src -j MACH=aarch64 2>&1 | \
    tee "$HOME"/illumos-gate/usr/src/build.aarch64.log
```

#### Build illumos for riscv64
```
rm -rf /data/proto/root_riscv64/* /tmp/solaris/  && \
    make -C "$HOME"/illumos-gate/usr/src tools && \
    make -C "$HOME"/illumos-gate/usr/src clobber -j MACH=riscv64 && \
    time make -C "$HOME"/illumos-gate/usr/src -j MACH=riscv64 2>&1 | \
    tee "$HOME"/illumos-gate/usr/src/build.riscv64.log
```
