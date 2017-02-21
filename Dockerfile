FROM python:3.5-alpine

EXPOSE 8080

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY hello.py /usr/src/app/hello.py

RUN apk update && \
    apk add --no-cache pwgen git wget && \
    addgroup wso2 && adduser -g '' -s /bin/bash -D -G wso2 wso2user

USER wso2user


CMD [ "python", "hello.py" ]
