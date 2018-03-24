FROM ubuntu:17.10

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    g++ \
    python-dev \
    python3-dev \
    autotools-dev \
    libicu-dev \
    build-essential \
    libbz2-dev \
    libboost-all-dev \
    python-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG boost_version=1.66.0
ARG boost_dir=boost_1_66_0
ENV boost_version ${boost_version}

RUN wget https://dl.bintray.com/boostorg/release/${boost_version}/source/${boost_dir}.tar.gz && \
    tar xfz ${boost_dir}.tar.gz && \
    rm ${boost_dir}.tar.gz && \
    cd ${boost_dir} && \
    ./bootstrap.sh && \
    ./b2 --with=all --prefix=/usr -j 4 link=shared runtime-link=shared install && \
    cd .. && rm -rf ${boost_dir}${boost_version} && ldconfig

RUN \
    pip install --upgrade pip && \
    pip install --upgrade setuptools && \

CMD bash
