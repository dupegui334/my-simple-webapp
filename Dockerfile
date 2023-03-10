FROM python:3.9-slim-buster
WORKDIR /opt/web-app
COPY app/ .
RUN pip install -r requirements.txt
ENTRYPOINT FLASK_APP=app.py flask run --host=0.0.0.0