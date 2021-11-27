#!/bin/bash
VER=2021.11.27

docker build \
       -t toshiara/tidyversejp \
       -t toshiara/tidyversejp:${VER} \
       .
