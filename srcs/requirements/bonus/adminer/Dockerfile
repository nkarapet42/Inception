FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y wget php-cli php php-mysql && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html
RUN wget https://www.adminer.org/latest.php -O adminer.php
RUN mv adminer.php /var/www/html/index.php

EXPOSE 9000

CMD ["php", "-S", "0.0.0.0:9000", "-t", "/var/www/html"]