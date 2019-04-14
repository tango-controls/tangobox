FROM ubuntu:bionic

RUN apt update \
 && apt install -y \
    supervisor \
    python \
    python-enum34 \
    openjdk-8-jre-headless \
    libsodium23 \
    libpgm-5.2-0 \
    zlib1g \
    libzmq5 \
    libomniorb4-2 \
    libcos4-2 \
    libboost-python1.65.1 \
    `# build deps` \
    git \
    ant \
    python-pip \
    g++ \
    make \
    cmake \
    autotools-dev \
    automake \
    omniidl \
    zlib1g-dev \
    libzmq3-dev \
    libomniorb4-dev \
    libcos4-dev \
    libboost-python-dev \
 && update-java-alternatives --set java-1.8.0-openjdk-amd64 \
 && cd / \
 && git clone --branch prepare-9.3.3 --depth 1 https://github.com/tango-controls/TangoSourceDistribution.git \
 && cd TangoSourceDistribution/ \
 && ant build package \
 && cd .. \
 && tar xf TangoSourceDistribution/build/tango-dev.tar.gz \
 && cd tango-*/ \
 && ./configure \
    --prefix=/usr/local \
    --enable-mariadb \
    --enable-shared \
    --enable-static \
    --disable-dbserver \
    --disable-dbcreate \
 && make -j4 \
 && make install \
 && strip /usr/local/lib/libtango.a \
 && strip /usr/local/lib/libtango.so.9.3.3 \
 && ldconfig \
 && pip install numpy \
 && pip install sphinx \
 && pip install sphinx_rtd_theme \
 && pip install lxml \
 && cd / \
 && git clone --branch v9.3.0 https://github.com/tango-controls/pytango.git \
 && cd pytango/ \
 && git cherry-pick --no-commit bfdc6bbbd5077b2a5b0a4ee8c846d746117b192a \
 && git cherry-pick --no-commit c09c337a0d594825952f797c8fa9de5d09fe890c \
 && python setup.py bdist_wheel \
 && pip install /pytango/dist/pytango-*whl \
 && pip uninstall -y sphinx_rtd_theme \
 && pip uninstall -y sphinx \
 && apt autoremove -y \
    git \
    ant \
    python-pip \
    g++ \
    make \
    cmake \
    autotools-dev \
    automake \
    omniidl \
    zlib1g-dev \
    libzmq3-dev \
    libomniorb4-dev \
    libcos4-dev \
    libboost-python-dev \
 && apt clean \
 && rm -rf ~/.cache \
 && rm -rf /TangoSourceDistribution \
 && rm -rf /tango-* \
 && rm -rf /pytango

COPY resources/tango_register_device /usr/local/bin/

ENV TANGO_HOST tangobox:10000
