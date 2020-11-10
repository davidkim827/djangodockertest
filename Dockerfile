# get django image
FROM python

#add metadata to image
LABEL maintainer = "David Kim <davidkim827@gmail.com>"

ADD . /usr/src/app
WORKDIR /usr/src/app

EXPOSE 8080/tcp

RUN ["pip", "install", "-r", "backend/requirements.txt"]

CMD ["gunicorn", "-b", "0.0.0.0:8080", "--log-level", "warning", "dockertest.wsgi", "--workers", "3"]
