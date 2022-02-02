FROM php:8.1.2-fpm

RUN apt-get update && apt-get install -y ffmpeg \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && rm -rf /var/lib/apt/lists/* \
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"