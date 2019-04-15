FROM base-new:latest AS build-com
RUN apt update \
 && apt install -y \
    g++ \
    make \
    subversion \
    libzmq3-dev \
    libomniorb4-dev \
    libcos4-dev

FROM build-com AS build-com-serial
RUN svn checkout http://svn.code.sf.net/p/tango-ds/code/DeviceClasses/Communication/SerialLine/tags/Serial_Release-2_1/ Serial \
 && cd Serial/src \
 && make \
    all \
    shlib \
    linux=1 \
    _solaris= \
    no_debug=1 \
    OS=any \
    BIN_DIR=bindir \
    INCLUDE_DIRS='-I. -I/usr/local/include/tango' \
    LIB_DIRS=-L/usr/local/lib \
 && cp bin/bindir/Serial /usr/local/bin/ \
 && cp shlib/bindir/Serial.so.2.1 /usr/local/lib/ \
 && ln -s Serial.so.2.1 /usr/local/lib/libserial.so \
 && ldconfig \
 && mkdir -p /usr/local/include/Serial \
 && cp *.h /usr/local/include/Serial/

FROM build-com-serial AS build-com-modbus
RUN svn checkout http://svn.code.sf.net/p/tango-ds/code/DeviceClasses/Communication/Modbus/tags/Modbus-Release-5.0.1/ Modbus \
 && cd Modbus/src \
 && g++ \
    -I. \
    -I/usr/local/include/tango \
    -I/usr/local/include/Serial  \
    -L/usr/local/lib \
    -g \
    -o Modbus \
    *.cpp \
    -lserial \
    -ltango \
    -llog4tango \
    -lomniORB4 \
    -lomniDynamic4 \
    -lomnithread \
    -lCOS4 \
    -ldl \
    -lpthread \
 && cp Modbus /usr/local/bin/ \
 && mkdir -p /usr/local/include/Modbus \
 && cp *.h /usr/local/include/Modbus/ \
 && g++ \
    -I. \
    -I/usr/local/include/tango \
    -I/usr/local/include/Serial \
    -g \
    -c \
    -fPIC \
    *.cpp \
 && rm main.o \
 && g++ -shared -o libmodbus.so *.o \
 && cp libmodbus.so /usr/local/lib/ \
 && ldconfig

FROM build-com-modbus AS build-com-modbus-composer
RUN svn checkout http://svn.code.sf.net/p/tango-ds/code/DeviceClasses/Calculation/ModbusComposer/trunk/ ModbusComposer \
 && cd ModbusComposer \
 && mv ExpParserTst.cpp ExpParserTst.cpp.donotcompile \
 && g++ \
    -I. \
    -I/usr/local/include/tango \
    -I/usr/local/include/Serial \
    -I/usr/local/include/Modbus \
    -L/usr/local/lib \
    -g \
    -o ModbusComposer \
    *.cpp \
    -lserial \
    -lmodbus \
    -ltango \
    -llog4tango \
    -lomniORB4 \
    -lomniDynamic4 \
    -lomnithread \
    -lCOS4 \
    -ldl \
    -lpthread \
 && cp ModbusComposer /usr/local/bin/

FROM base-new:latest

RUN apt update \
 && apt install -y git python-setuptools \
 && git clone https://github.com/sergirubio/PyPLC.git \
 && cd PyPLC \
 && python setup.py install \
 && cd .. \
 && rm -rf PyPLC \
 && apt autoremove -y git python-setuptools \
 && apt clean

COPY --from=build-com-modbus-composer \
    /usr/local/bin/Serial \
    /usr/local/bin/Modbus \
    /usr/local/bin/ModbusComposer \
    /usr/local/bin/

COPY --from=build-com-modbus-composer \
    /usr/local/lib/Serial.so.2.1 \
    /usr/local/lib/libmodbus.so \
    /usr/local/lib/

RUN cd /usr/local/lib \
 && ln -s Serial.so.2.1 libserial.so \
 && ldconfig

RUN chmod a+x /usr/local/bin/tango_register_device

COPY resources/supervisord.conf /etc/

CMD /usr/bin/supervisord -c /etc/supervisord.conf
