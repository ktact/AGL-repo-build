#!/bin/bash

docker run --rm -it \
  -v /home/ktact/agl/quillback-17.1.7:/home/builduser/quillback \
  agl-build:v1 \
  /bin/bash
