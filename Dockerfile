FROM 604255211065.dkr.ecr.us-east-1.amazonaws.com/base-alpine:latest

RUN apk update && apk add bash git python3 py3-pip redis vim

WORKDIR /app

COPY ./requirements.txt ./requirements.txt

RUN true \
  && apk add python3-dev g++ libffi-dev zlib-dev openssl-dev \
  && pip3 install --upgrade pip \
  && pip3 install -r /app/requirements.txt

COPY . .

ENTRYPOINT ["python3", "-m", "http.server"]
