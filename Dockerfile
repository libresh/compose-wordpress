FROM wordpress:fpm

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ssmtp \
 && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
COPY php.ini /usr/local/etc/php/php.ini

CMD ["/run.sh"]
