# Copyright (c) 2025 ARA Toshiaki
# Copyright (c) 2021 ARA Toshiaki
# Copyright (c) 2020 ARA Toshiaki
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM r-base:4.4.3

# Change environment to Japanese (Character and DateTime)
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen && \
    echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja" && \
    /bin/bash -c "source /etc/default/locale" && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime



LABEL lastupdate=2025.4.3
RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install --no-install-recommends -y \
    libcurl4-openssl-dev libfontconfig1-dev libgit2-dev libssl-dev \
    libxml2-dev zlib1g-dev libharfbuzz-dev libfribidi-dev \
    libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev \
    fonts-noto-cjk && \
    apt-get clean

RUN install2.r --error \
      --deps TRUE \
      -r https://cloud.r-project.org \
      -n -1 \
      tidyverse \
      formatR \
      remotes \
      githubinstall

## for Visual Studio Code
RUN install2.r --error \
      --deps TRUE \
      -r https://cloud.r-project.org \
      -n -1 \
      languageserver && \
    installGithub.r -u FALSE ManuelHentschel/vscDebugger

WORKDIR /workdir

VOLUME ["/workdir"]
CMD ["R"]

