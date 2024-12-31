FROM python:latest
WORKDIR /app
COPY . .
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN apt-get update && \
  apt-get install -y wget gnupg2 && \
  wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  echo "deb http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  apt-get update && \
  apt-get install -y postgresql-client-17

EXPOSE 8001
CMD ["python3", "app.py"]