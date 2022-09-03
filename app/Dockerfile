FROM ubuntu:trusty

# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai apt-get install -y --no-install-recommends \
    ca-certificates tzdata curl mysql-server apache2 \
    php5 libapache2-mod-php5 php5-mysql php5-mcrypt php-apc pwgen && \
    rm -rf /var/lib/apt/lists/ && \
    apt-get autoremove -y && \
    apt-get autoclean -y

RUN DIR=/var/www/html/sqli-labs && \
    mkdir -p ${DIR} && \
    cd ${DIR} && \
    curl -sL https://github.com/Audi-1/sqli-labs/tarball/master | \
    tar -zx --strip-components=1 && \
    sed "s/\$dbuser ='root';/\$dbuser ='$(cat /etc/mysql/debian.cnf | grep user | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc && \
    sed "s/\$dbpass ='';/\$dbpass ='$(cat /etc/mysql/debian.cnf | grep password | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    hash -r