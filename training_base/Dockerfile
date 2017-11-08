FROM tomcat:latest

RUN apt-get update -y && \
	apt-get install -y \
	mysql-server \
	mysql-client \
	apache2 \
	php5 \
	libapache2-mod-php5 \
	php5-mysql \
	php5-curl \
	supervisor \
        net-tools \
        vim && \
	rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
