FROM python:3.8 AS builder
MAINTAINER Andrei Okulov <as.okulov@gmail.com>

ENV \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_VERSION=1.2.0b2

RUN apt-get update && apt-get install -y build-essential unzip wget python-dev
RUN pip install poetry==${POETRY_VERSION}

WORKDIR /src

COPY pyproject.toml poetry.lock /src/
RUN poetry export --with prod --without-hashes --no-interaction --no-ansi -f requirements.txt -o requirements.txt
RUN pip install --prefix=/runtime --force-reinstall -r requirements.txt

FROM python:3.8-slim AS runtime

ARG APP_VERSION_ARG="default"
ENV APP_VERSION=$APP_VERSION_ARG \
    PYTHONUNBUFFERED=1

COPY --from=builder /runtime /usr/local
# psycopg2
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 lib/
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libpq.so.5 lib/
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libssl.so.1.1 lib/
#COPY --from=builder /usr/lib/x86_64-linux-gnu/liblber-2.4.so.2 lib/
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libldap-2.4.so.2 lib/
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libsasl2.so.2 lib/
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libgnutls.so.30 lib/
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libldap_r-2.4.so.2 lib/
# mariadb
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libmariadb3 /usr/lib/x86_64-linux-gnu/libmariadb3
#COPY --from=builder /usr/lib/x86_64-linux-gnu/pkgconfig/libmariadb.pc /usr/lib/x86_64-linux-gnu/pkgconfig/libmariadb.pc
#COPY --from=builder /usr/lib/x86_64-linux-gnu/pkgconfig/mariadb.pc /usr/lib/x86_64-linux-gnu/pkgconfig/mariadb.pc
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libmariadb.a /usr/lib/x86_64-linux-gnu
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libmariadb3 /usr/lib/x86_64-linux-gnu
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libmariadbclient.a /usr/lib/x86_64-linux-gnu
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libmariadb.so /usr/lib/x86_64-linux-gnu
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libmariadb.so.3 /usr/lib/x86_64-linux-gnu
#COPY --from=builder /usr/lib/x86_64-linux-gnu/libmariadbclient.so /usr/lib/x86_64-linux-gnu

COPY . /app
WORKDIR /app

EXPOSE 8000
ENTRYPOINT ["/app/entrypoint.sh"]