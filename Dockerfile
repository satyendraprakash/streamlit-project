# app/Dockerfile

FROM python:3.10-slim

# Create app directory
WORKDIR /app

RUN apt-get update && apt-get install -y && rm -rf /var/lib/apt/lists/*

# Install app dependencies
COPY requirements.txt ./

RUN pip3 install -r requirements.txt

# Bundle app source
COPY . /app

EXPOSE 8080

ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8080", "--server.address=0.0.0.0"]