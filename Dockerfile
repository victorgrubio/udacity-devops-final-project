FROM python:3.6.10-slim-stretch
WORKDIR /opt/app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python3", "app.py" ]
