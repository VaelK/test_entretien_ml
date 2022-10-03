FROM python:3.10

WORKDIR /usr/src/app

RUN apk update && apk add python3-dev \
                          gcc \
                          libc-dev \
                          libffi-dev
                          
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
