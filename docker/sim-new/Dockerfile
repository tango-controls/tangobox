FROM base-new:latest AS build-sim
RUN apt update \
 && apt install -y \
    g++ \
    make \
    flex \
    libzmq3-dev \
    libomniorb4-dev \
    libcos4-dev
COPY resources/linac /linac/src
RUN cd /linac/src/GenericMultiChannel   && make -j2 SIMU=1
RUN cd /linac/src/GenericSimulator      && make -j2 SIMU=1
RUN cd /linac/src/Linac                 && make -j2 SIMU=1
RUN cd /linac/src/LinacCooling          && make -j2 SIMU=1
RUN cd /linac/src/LinacGun              && make -j2 SIMU=1
RUN cd /linac/src/LinacGunAux           && make -j2 SIMU=1
RUN cd /linac/src/LinacGunHVPS          && make -j2 SIMU=1
RUN cd /linac/src/LinacHVPS             && make -j2 SIMU=1
RUN cd /linac/src/LinacModAux           && make -j2 SIMU=1
RUN cd /linac/src/LinacModulator        && make -j2 SIMU=1
RUN cd /linac/src/LinacRF               && make -j2 SIMU=1
RUN cd /linac/src/Simurelay             && make -j2 SIMU=1
RUN cd /linac/src/LinacSequencer \
 && sed -i '$s/.*/LDFLAGS += -l:libfl.a/' Makefile \
 && make -j2 SIMU=1
RUN cd /linac/src/LinacMediumLevel \
 && make -j2 SIMU=1 \
    LINACRF_HOME=../LinacRF \
    LINACMODULATOR_HOME=../LinacModulator \
    LINACMODAUX_HOME=../LinacModAux \
    LINACHVPS_HOME=../LinacHVPS \
    LINACGUNAUX_HOME=../LinacGunAux \
    LINACGUN_HOME=../LinacGun \
    LINACCOOLING_HOME=../LinacCooling
RUN mkdir -p /linac/bin
RUN for d in /linac/src/*; do cd $d; pwd; cp bin/* /linac/bin/; cd ..; done

FROM base-new:latest

RUN apt update \
 && apt install -y libfl2 \
 && apt clean

COPY --from=build-sim \
    /linac/bin/* \
    /usr/local/bin/

COPY resources/start.sh /start.sh

CMD ["/start.sh"]
