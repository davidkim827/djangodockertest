# get django image
FROM python

#add metadata to image
LABEL maintainer = "David Kim <davidkim827@gmail.com>"

ADD . /opt/TestApp

WORKDIR /opt/TestApp

EXPOSE 8080/tcp

RUN ["python3", "-m", "venv", ".venv"]
RUN ["source", ".venv/bin/activate"]
RUN ["pip", "install", "-r", "requirements.txt"]

CMD ["gunicorn", "-b", "0.0.0.0:8080", "-w", "2", "-k", "uvicorn.workers.UvicornWorker", "--log-level", "warning", "backend.dockertest.dockertest.wsgi", "2>&1", "&"]
