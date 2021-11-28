#!/bin/bash
VER=2021.11.28

docker build -f Dockerfile.shiny\
       -t toshiara/tidyversejp:shiny \
       -t toshiara/tidyversejp:shiny-${VER} \
       .
