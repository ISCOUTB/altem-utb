FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    build-essential \
    mariadb-client \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl

# Borramos cache
RUN apt update; apt install -y procps
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalamos extensiones
RUN docker-php-ext-install pdo_mysql zip exif pcntl
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd

# Instalar composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# agregar usuario para la aplicación laravel
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Establecer los permisos del directorio de la aplicación

#RUN mkdir -p /run/php/
# cambiar el usuario actual por www
#USER www-data

# exponer el puerto 9000 e iniciar php-fpm server
EXPOSE 9000
#RUN service php7.2-fpm start
CMD ["php-fpm"]