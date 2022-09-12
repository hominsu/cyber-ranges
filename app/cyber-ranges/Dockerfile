# syntax=docker/dockerfile:1.4

# fetch tarball
FROM hominsu/cyber-ranges:runtime-tarball as tarball

ARG PREFIX=/var/www/html

RUN DIR=${PREFIX}/pikachu && \
    mkdir -p ${DIR} && cd ${DIR} && \
    curl -sL https://github.com/zhuifengshaonianhanlu/pikachu/tarball/master | \
    tar -zx --strip-components=1 && \
    hash -r

RUN DIR=${PREFIX}/sqli-labs && \
    mkdir -p ${DIR} && cd ${DIR} && \
    curl -sL https://github.com/Audi-1/sqli-labs/tarball/master | \
    tar -zx --strip-components=1 && \
    hash -r

RUN DIR=${PREFIX}/upload-labs && \
    mkdir -p ${DIR} && cd ${DIR} && \
    curl -sL https://github.com/c0ny1/upload-labs/tarball/master | \
    tar -zx --strip-components=1 && \
    hash -r

RUN DIR=${PREFIX}/xss-labs && \
    mkdir -p ${DIR} && cd ${DIR} && \
    curl -sL https://github.com/do0dl3/xss-labs/tarball/master | \
    tar -zx --strip-components=1 && \
    hash -r

# cyber-ranges
FROM hominsu/cyber-ranges:runtime-mysql
# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

ARG PREFIX=/var/www/html

COPY --from=tarball ${PREFIX} ${PREFIX}

RUN cd ${PREFIX}/pikachu && \
    sed "s/define('DBUSER', 'root');/\define('DBUSER', '$(cat /etc/mysql/debian.cnf | grep user | awk 'NR==1{print $3}')');/g" -i inc/config.inc.php && \
    sed "s/define('DBPW', '');/define('DBPW', '$(cat /etc/mysql/debian.cnf | grep password | awk 'NR==1{print $3}')');/g" -i inc/config.inc.php && \
    cd ${PREFIX}/sqli-labs && \
    sed "s/\$dbuser ='root';/\$dbuser ='$(cat /etc/mysql/debian.cnf | grep user | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc && \
    sed "s/\$dbpass ='';/\$dbpass ='$(cat /etc/mysql/debian.cnf | grep password | awk 'NR==1{print $3}')';/g" -i sql-connections/db-creds.inc && \
    hash -r
