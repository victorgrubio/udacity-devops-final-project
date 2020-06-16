FROM python:3.7.3-strech-slim
WORKDIR /opt/app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python3", "app.py" ]