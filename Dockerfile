FROM python:3.10.7-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get -y install python3-dev \
                       gcc \
                       libc-dev \
                       libffi-dev \
                       libevent-dev

RUN cp /etc/apt/sources.list /etc/apt/sources.list~
RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
RUN apt-get update

RUN apt-get build-dep python-numpy

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
