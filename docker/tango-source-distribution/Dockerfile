FROM ubuntu:bionic

RUN apt update \
 && apt install -y \
    git \
    ant \
    python-pip \
    g++ \
    make \
    cmake \
    autotools-dev \
    automake \
    checkinstall \
    openjdk-8-jre-headless \
    omniidl \
    zlib1g-dev \
    libzmq3-dev \
    libomniorb4-dev \
    libcos4-dev \
    libboost-python-dev \
    libmariadb-dev \
    libmariadbclient-dev

RUN pip install \
    sphinx \
    sphinx_rtd_theme \
    numpy

RUN RUN  update-java-alternatives --set java-1.8.0-openjdk-amd64

RUN git clone --branch prepare-9.3.3 --depth 1 https://github.com/tango-controls/TangoSourceDistribution.git \
 && cd TangoSourceDistribution/ \
 && ant build package \
 && cd .. \
 && tar xf TangoSourceDistribution/build/tango-dev.tar.gz

RUN cd tango-*/ \
 && ./configure \
  --prefix=/usr/local \
  --without-zlib \
  --enable-mariadb \
  --with-mysql-admin=root \
  --with-mariadbclient-include="/usr/include/mysql" \
  --with-mariadbclient-lib="/usr/lib/x86_64-linux-gnu" \
  --disable-dbcreate \
  --enable-dbserver

RUN cd tango-*/ \
 && make -j4

RUN cd tango-*/ \
 && mkdir -p usr/local/share/tango/db \
 && cp cppserver/database/*.sql usr/local/share/tango/db/ \
 && echo './usr/local/share/tango/db/' > include_db.txt

RUN cd tango-*/ \
 && checkinstall \
    --install=no \
    --fstrans=no \
    --showinstall=no \
    --backup=no \
    --type=debian \
    --pkgsource="https://github.com/tango-controls/TangoSourceDistribution" \
    --pkglicense="LGPLv3" \
    --deldesc=no \
    --nodoc \
    --strip \
    --stripso \
    --maintainer="tango" \
    --pkgarch=$(dpkg --print-architecture) \
    --pkgversion="9.3.3" \
    --pkgrelease="SNAPSHOT" \
    --pkgname=tango-source-distribution \
    --include=include_db.txt \
    --requires="libc6,libstdc++6,libzmq5,libomniorb4-2,libcos4-2,libomnithread4,libsodium23,libpgm-5.2-0,libmariadb3" \
    make install

RUN ldconfig

RUN git clone --branch v9.3.0 https://github.com/tango-controls/pytango.git \
 && cd pytango/ \
 && git cherry-pick --no-commit bfdc6bbbd5077b2a5b0a4ee8c846d746117b192a \
 && git cherry-pick --no-commit c09c337a0d594825952f797c8fa9de5d09fe890c

RUN cd pytango/ \
 && python setup.py bdist_wheel

FROM alpine:3.9

COPY --from=0 \
    /tango-9.3.3/tango-source-distribution_9.3.3-SNAPSHOT_amd64.deb \
    /

COPY --from=0 \
    /pytango/dist/pytango-9.3.0-cp27-cp27mu-linux_x86_64.whl \
    /
