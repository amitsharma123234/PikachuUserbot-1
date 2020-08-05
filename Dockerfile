
FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

RUN apt-get update && apt upgrade -y && apt-get install sudo
RUN apt-get install -y\
    coreutils \
    bash \
    nodejs \
    bzip2 \
    curl \
    figlet \
    gcc \
    g++ \
    git \
    aria2 \
    util-linux \
    libevent-dev \
    libjpeg-dev \
    libffi-dev \
    libpq-dev \
    libwebp-dev \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    musl \
    neofetch \
    libcurl4-openssl-dev \
    postgresql \
    postgresql-client \
    postgresql-server-dev-all \
    axel \
    openssl \
    pv \
    jq \
    wget \
    python3 \
    python3-dev \
    python3-pip \
    libreadline-dev \
    zipalign \
    sqlite \
    ffmpeg \
    libsqlite3-dev \
    zlib1g-dev \
    recoverjpeg \
    zip \
    megatools \
    chromium-chromedriver \
    libfreetype6-dev

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install -y ./google-chrome-stable_current_amd64.deb
RUN pip3 install --upgrade pip setuptools 
RUN pip3 install --upgrade pip install wheel 
RUN rm -r /root/.cache
RUN chmod +x /usr/local/bin/*

RUN git clone https://github.com/ItzSjDude/PikachuUserbot /root/pikabot
RUN mkdir /root/userbot/bin/
WORKDIR /root/pikabot/
RUN pip3 install -r requirements.txt
CMD ["python3","-m","userbot"]

