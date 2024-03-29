# get django image
FROM python

#add metadata to image
LABEL maintainer = "David Kim <davidkim827@gmail.com>"

ADD . /usr/src/app
WORKDIR /usr/src/app

EXPOSE 8080/tcp

RUN ["pip", "install", "-r", "backend/requirements.txt"]
RUN ["echo", "'hi'"]

CMD ["gunicorn", "-b", "0.0.0.0:8080", "--log-level", "warning", "--chdir", "./backend/dockertest/dockertest", "wsgi:application"]
