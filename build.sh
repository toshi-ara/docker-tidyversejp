#!/bin/bash
VER=2020.10.5

docker build \
       -t toshiara/tidyversejp \
       -t toshiara/tidyversejp:${VER} \
       .
