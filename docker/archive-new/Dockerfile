FROM base-new:latest AS build-archive
RUN apt update && apt install -y unzip wget
RUN wget https://sourceforge.net/projects/tango-cs/files/tools/ArchivingRoot-16.2.4.zip -P /tmp/mambo
RUN cd /tmp/mambo && unzip ArchivingRoot-*.zip
RUN chmod +x \
    /tmp/mambo/bin/linux/* \
    /tmp/mambo/device/linux/*
RUN sed -i '1i#!/usr/bin/env bash' \
    /tmp/mambo/bin/linux/* \
    /tmp/mambo/device/linux/*

FROM base-new:latest

RUN apt update \
 && apt install -y \
    mariadb-client \
    mariadb-server \
    libmysqlclient20 \
    libmariadb3 \
 && apt clean

ENV ARCHIVING_ROOT /usr/local
ENV MYSQL_ROOT_PASSWORD secret

COPY resources/my.cnf /etc/mysql/
COPY resources/add-users.sql /usr/local/db/
COPY resources/initdb.sh resources/initusers.sh /usr/local/bin/

COPY --from=build-archive \
    /tmp/mambo/db/* \
    /usr/local/db/

RUN bash -c "mysqld_safe --defaults-file=/etc/mysql/my.cnf &" \
 && sleep 5 \
 && /usr/local/bin/initdb.sh \
 && /usr/local/bin/initusers.sh \
 && sleep 10 \
 && rm /var/run/mysqld/mysqld.pid

COPY --from=build-archive \
    /tmp/mambo/bin/linux/* \
    /tmp/mambo/device/linux/* \
    /usr/local/bin/

COPY --from=build-archive \
    /tmp/mambo/conf/*.xml \
    /usr/local/conf/

COPY --from=build-archive \
    /tmp/mambo/conf/snap/* \
    /usr/local/conf/snap/

COPY --from=build-archive \
    /tmp/mambo/lib/java/* \
    /usr/local/lib/java/

COPY resources/supervisord.conf /etc/supervisord.conf

CMD /usr/bin/supervisord -c /etc/supervisord.conf
