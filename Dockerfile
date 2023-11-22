FROM python:3.12-bookworm AS builder

ENV \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false

RUN apt-get update && apt-get install -y build-essential unzip wget python-dev
RUN pip install poetry

WORKDIR /src

COPY pyproject.toml poetry.lock /src/
RUN poetry export --with prod --without-hashes --no-interaction --no-ansi -f requirements.txt -o requirements.txt
RUN pip install --prefix=/runtime --force-reinstall -r requirements.txt

FROM python:3.12-slim-bookworm AS runtime

ARG APP_VERSION_ARG="default"
ENV APP_VERSION=$APP_VERSION_ARG \
    PYTHONUNBUFFERED=1

COPY --from=builder /runtime /usr/local

COPY . /app
WORKDIR /app

EXPOSE 8000
ENTRYPOINT ["/app/entrypoint.sh"]