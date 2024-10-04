# 1. debian:11 베이스 이미지 사용
FROM debian:11

# 2. 필요한 패키지 업데이트 및 설치
RUN apt-get update && apt-get install -y \
    php \
    php-mysqli \
    php-pgsql \
    php-sqlite3 \
    php-json \
    php-mbstring \
    php-intl \
    php-curl \
    php-xml \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 3. Adminer 다운로드
RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php" -O /var/www/html/index.php

# 4. PHP 내장 웹서버 포트 설정
EXPOSE 8080

# 5. Adminer 시작
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]