FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update; apt-get install -y php-zip php-curl php-xmlrpc \
    php-gd php-mysql php-mbstring php-xml libapache2-mod-php php-fpm apache2 curl \
    php-cli php-mbstring git unzip npm nodejs-dev node-gyp libssl1.0-dev
#RUN apt upgrade -y
# timezone configuration
ENV TZ="America/Bogota"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Composer installer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
#RUN apt install -y --reinstall systemd
# Default site activation
COPY data/altem.conf /etc/apache2/sites-available/
RUN a2dissite 000-default.conf; a2ensite altem.conf; a2enmod rewrite; a2enmod ssl;
# Source code and libraries
COPY --chown=www-data:www-data ./altem /altem
# SSL for apache server
COPY --chown=root:root ./data/ssl/utb.edu.co.crt /etc/apache2/ssl/utb.edu.co.crt
COPY --chown=root:root ./data/ssl/utb.edu.co.key /etc/apache2/ssl/utb.edu.co.key
# Composer update
WORKDIR /altem/
RUN composer install; composer dump-autoload
# Frontend install
WORKDIR /altem/public
RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g -y bower bower-npm-resolver; bower --allow-root install
#VOLUME /altem /data/altem
RUN chown -R www-data:www-data /altem/
# System clean up
RUN apt install nano
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
CMD ["apachectl", "-D", "FOREGROUND"]