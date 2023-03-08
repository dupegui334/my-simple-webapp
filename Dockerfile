FROM ubuntu

COPY app/app.py /opt/web-app/app.py
COPY app/requirements.txt /opt/web-app/requirements.txt
COPY app/templates/ /opt/web-app/templates/

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install -r /opt/web-app/requirements.txt

ENTRYPOINT python3 /opt/web-app/app.py
