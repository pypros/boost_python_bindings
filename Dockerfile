FROM ubuntu:17.10

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    g++ \
    python-dev \
    python3-dev \
    autotools-dev \
    libicu-dev \
    build-essential \
    libbz2-dev \
    libboost-all-dev \
    python-pip \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/lib/x86_64-linux-gnu/libboost_python-py36.so /usr/lib/x86_64-linux-gnu/libboost_python3.so

RUN \
    pip install --upgrade pip && \
    pip install --upgrade setuptools

RUN \
    pip3 install --upgrade pip && \
    pip3 install --upgrade setuptools


