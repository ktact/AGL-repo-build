# How to use
```bash
$ git clone https://github.com/ktact/AGL-repo-build.git
$ cd AGL-repo-build
$ docker build -t agl-build:v1 .
$ docker run -v /path/to/host/directory:/path/to/container/directory -u 1000 -it agl-build:v1
builduser@15309978dcae:~$ PATH=~/bin:$PATH
builduser@15309978dcae:~$ mkdir ws
builduser@15309978dcae:~$ cd ws
builduser@15309978dcae:~$ repo init -b refs/tags/quillback/17.1.7 -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
builduser@15309978dcae:~$ repo sync
builduser@15309978dcae:~$ source meta-agl/scripts/aglsetup.sh -m qemux86-64 -b qemux86-64 agl-demo agl-devel # source meta-agl/scripts/aglsetup.sh -m virtio-aarch64 -b build-virtio-aarch64 agl-demo
builduser@15309978dcae:~$ bitbake agl-demo-platform # agl-ivi-demo-qt
```
