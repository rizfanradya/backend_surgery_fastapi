FROM python:latest
WORKDIR /app
COPY . .
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get install -y postgresql-client
EXPOSE 8001
CMD ["python3", "app.py"]