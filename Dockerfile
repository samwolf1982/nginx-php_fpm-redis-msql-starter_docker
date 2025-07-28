# Dockerfile
FROM php:5.6-apache

RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian stretch main" > /etc/apt/sources.list && \
    echo "deb [check-valid-until=no] http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list

# Оновлюємо та встановлюємо git, дозволивши неперевірені пакети
RUN apt-get update && apt-get install -y --allow-unauthenticated git && rm -rf /var/lib/apt/lists/*




RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN a2enmod rewrite
# Копіюємо нашу конфігурацію сайту всередину образу
COPY my-site.conf /etc/apache2/sites-available/my-site.conf

# Вимикаємо стандартний сайт і вмикаємо наш
RUN a2dissite 000-default.conf && a2ensite my-site.conf
