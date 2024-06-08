FROM ubuntu

RUN apt update \
    && apt install -y wget pkg-config build-essential autoconf bison re2c libxml2-dev libsqlite3-dev

WORKDIR /usr/src/php-build
RUN wget https://www.php.net/distributions/php-8.3.8.tar.gz \
    && tar -xvf php-8.3.8.tar.gz \
    && rm php-8.3.8.tar.gz \
    && cd php-8.3.8 \
    && ./buildconf \
    && ./configure --enable-debug \
    && make -j4 \
    && make install

RUN rm -r php-8.3.8
