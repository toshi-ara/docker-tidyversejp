# toshiara/tidyversejp

This repository is designed for Japanese only, sorry!

# 概要

Rの[公式dockerイメージ](https://hub.docker.com/_/r-base)に

- tidyverseパッケージ群
- Noto CJKフォント

を追加したもの

[rockerjp/tidyverse](https://hub.docker.com/r/rockerjp/tidyverse)と異なり、RStudioは**含まれていません**


# 起動方法

```bash
$ docker run --rm -it \
    -u docker \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/R:/home/docker/R \
    -v ${PWD}:/workdir \
    toshiara/tidyversejp
```

# License

## Dockerfile
MIT (c) ARA Toshiaki

