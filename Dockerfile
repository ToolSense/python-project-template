FROM python:3.8-slim
MAINTAINER Andrey Okulov <okulov@ya.ru>

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && pip install -r requirements.txt

ARG APP_VERSION_ARG="default"

ENV APP_VERSION=$APP_VERSION_ARG

EXPOSE 80

ENTRYPOINT ["python3", "main.py"]