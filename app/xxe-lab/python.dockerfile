# syntax=docker/dockerfile:1.4

# fetch tarball
FROM hominsu/cyber-ranges:runtime-tarball as tarball

ARG PREFIX=/xxe-lab

RUN set -eux; \
    mkdir ${PREFIX}; \
    cd ${PREFIX}; \
    curl -sL https://github.com/c0ny1/xxe-lab/tarball/master | \
    tar -zx --strip-components=1

# xxe-lab/python_xxe
FROM python:2.7-buster
# image info
ARG AUTHOR_NAME
ARG AUTHOR_EMAIL

# label
LABEL author=${AUTHOR_NAME} email=${AUTHOR_EMAIL}

RUN python -m pip install flask

WORKDIR /app/xxe-lab/python_xxe

COPY --from=tarball /xxe-lab/python_xxe /app/xxe-lab/python_xxe

ENV FLASK_APP="xxe.py"
CMD ["python", "-m" , "flask", "run", "--host=0.0.0.0"]