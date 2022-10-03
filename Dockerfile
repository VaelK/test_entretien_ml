FROM python:3.8-slim

WORKDIR /usr/src/app

RUN apt-get update

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
