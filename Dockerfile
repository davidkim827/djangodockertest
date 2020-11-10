# get django image
FROM python

#add metadata to image
LABEL maintainer = "David Kim <davidkim827@gmail.com>"

ADD . /opt/TestApp
WORKDIR /opt/TestApp

EXPOSE 8080/tcp

RUN ["pip", "install", "-r", "backend/requirements.txt"]
RUN ["python", "backend/manage.py", "migrate"]

CMD ["gunicorn", "-b", "0.0.0.0:8080", "--log-level", "warning", "backend.dockertest.dockertest.wsgi"]
