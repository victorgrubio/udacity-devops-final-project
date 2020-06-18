FROM python:3.6-slim-jessie
WORKDIR /opt/app
COPY . /opt/app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python3", "app.py" ]
