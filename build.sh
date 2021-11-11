#!/bin/bash
VER=2021.11.12

docker build \
       -t toshiara/tidyversejp \
       -t toshiara/tidyversejp:${VER} \
       .
