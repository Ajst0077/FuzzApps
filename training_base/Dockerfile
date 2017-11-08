FROM tomcat:latest

RUN apt-get update -y && \
	apt-get install -y \
	apt-transport-https \
	lsb-release \
	ca-certificates && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
	apt-get install -y \
	mysql-server \
	mysql-client \
	apache2 \
	php5.6 \
	libapache2-mod-php5.6 \
	php5.6-mysql \
	php5.6-curl \
	supervisor \
        net-tools \
        vim && \
	rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
