# Copyright (c) 2020 ARA Toshiaki
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM r-base:4.0.3

# Change environment to Japanese (Character and DateTime)
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen && \
    echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja" && \
    /bin/bash -c "source /etc/default/locale" && \
    ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime


LABEL lastupdate=2020.10.13
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    libcurl4-openssl-dev libssl-dev libxml2-dev zlib1g-dev \
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

WORKDIR /workdir

VOLUME ["/workdir"]
CMD ["R"]

