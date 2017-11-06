FROM tomcat:latest

RUN apt-get update -y && \
	apt-get install -y \
	mysql-server \
	mysql-client \
	apache2 \
	php \
	libapache2-mod-php \
	php-mysql \
	php-curl \
	supervisor && \
	rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]