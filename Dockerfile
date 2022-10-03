FROM python:3.10.7-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install python3-dev \
                          			  gcc \
                          			  libc-dev \
                          			  libffi-dev

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
