FROM resin/rpi-raspbian

RUN apt-get update && apt-get upgrade \
  && apt-get install apache2 \
     php5 \
     php5-mysql \
     php5-mcrypt \ 
     php5-gd \
     libapache2-mod-php5 \
     wget \
     unzip \
  && wget http://c.speedtest.net/mini/mini.zip -O /tmp/mini.zip \
  && unzip /tmp/mini.zip -d /tmp/ \
  && mv /tmp/mini/index-php.html /tmp/mini/index.html \
  && mv /tmp/mini /var/www/html/speedtest

EXPOSE 80

COPY ./entrypoint.sh /tmp/
ENTRYPOINT ["/tmp/entrypoint.sh"]

  
