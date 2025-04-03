#!/bin/bash
VER=2025.4.3

docker build -f Dockerfile.shiny\
       -t toshiara/tidyversejp:shiny \
       -t toshiara/tidyversejp:shiny-${VER} \
       .
