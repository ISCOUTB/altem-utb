FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update; apt upgrade -y; apt-get install -y php-zip php-curl php-xmlrpc \
    php-gd php-mysql php-mbstring php-xml libapache2-mod-php php-fpm apache2 curl \
    php-cli php-mbstring git unzip npm nodejs-dev node-gyp libssl1.0-dev

ENV TZ="America/Bogota"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Instalar composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN apt install -y --reinstall systemd

COPY ./altem.local.conf /etc/apache2/sites-available/
RUN a2dissite 000-default.conf
RUN a2ensite altem.local.conf
RUN service apache2 start

COPY ./altem /var/www/altem
WORKDIR /var/www/altem/
RUN composer install
RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g -y bower bower-npm-resolver
WORKDIR /var/www/altem/public
RUN bower --allow-root install

#RUN chown -R www-data:www-data /var/www/altem/

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apache2ctl configtest

CMD ["/usr/sbin/apache2"]
