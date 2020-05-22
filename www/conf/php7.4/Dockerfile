FROM php:7.4-fpm
# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo "deb http://mirrors.aliyun.com/debian/ buster main non-free contrib \n \
	deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib \n \
	deb http://mirrors.aliyun.com/debian-security buster/updates main \n \
	deb-src http://mirrors.aliyun.com/debian-security buster/updates main \n \
	deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib \n \
	deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib \n \
	deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib \n \
	deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib" > /etc/apt/sources.list \
	&& apt-get update --fix-missing \
		&& apt-get install -y --fix-missing \
		build-essential \
		libmagickcore-dev \
		libmagickwand-dev \
		imagemagick \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng-dev \
		&& docker-php-ext-install -j$(nproc) gd iconv pdo_mysql opcache gettext sockets \
		&& pecl install redis-5.2.2 \
		&& pecl install swoole-4.5.1 \
		&& pecl install imagick \
		&& pecl install mcrypt \
		&& docker-php-ext-enable redis imagick mcrypt swoole


