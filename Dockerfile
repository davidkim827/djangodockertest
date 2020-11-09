# get django image
FROM django

#add metadata to image
LABEL maintainer = "David Kim <davidkim827@gmail.com>"

ADD . /opt/TestApp

WORKDIR /opt/TestApp

EXPOSE 8080/tcp

RUN ["python3", "-m", "venv", ".venv"]
RUN ["source", ".venv/bin/activate"]
RUN ["pip", "install", "-r", "requirements.txt"]

CMD ["python", "./backend/dockertest/manage.py runserver 0.0.0.0:8080"]