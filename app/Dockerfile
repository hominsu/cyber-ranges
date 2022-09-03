FROM ubuntu:bionic

# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai apt-get install -y --no-install-recommends \
    ca-certificates tzdata curl apache2 mysql-server libapache2-mod-php php-mysql && \
    rm -rf /var/lib/apt/lists/ && \
    apt-get autoremove -y && \
    apt-get autoclean -y

RUN DIR=/var/www/html/sqli && \
    mkdir -p ${DIR} && \
    cd ${DIR} && \
    curl -sL https://github.com/Audi-1/sqli-labs/tarball/master | \
    tar -zx --strip-components=1 && \
    DB_USER=$(cat /etc/mysql/debian.cnf | grep user | awk 'NR==1{print $3}') && \
    DB_PASS=$(cat /etc/mysql/debian.cnf | grep password | awk 'NR==1{print $3}') && \
    sed "s/\$dbuser ='root';/\$dbuser ='$DB_USER';/g" -i sql-connections/db-creds.inc && \
    sed "s/\$dbpass ='';/\$dbpass ='$DB_PASS';/g" -i sql-connections/db-creds.inc && \
    chmod -R 770 /var/lib/mysql && \
    chgrp -R mysql /var/lib/mysql && \
    /etc/init.d/mysql start && \
    mysql -h localhost --user=${DB_USER} --password=${DB_PASS} < sql-lab.sql && \
    hash -r