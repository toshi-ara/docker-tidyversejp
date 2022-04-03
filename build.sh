#!/bin/bash
VER=2022.4.3

docker build \
       -t toshiara/tidyversejp \
       -t toshiara/tidyversejp:${VER} \
       .
