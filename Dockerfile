# Base image to pull
FROM python:2

# Container admin
MAINTAINER takahashi@pharmakom.net

# Install required software
RUN apt-get update && apt-get install -y \
	python-dev \ 
	build-essential \
        python-pip

# Install required python libraries.
COPY requirements.txt /tmp/requirements.txt
WORKDIR /tmp
RUN pip install -r requirements.txt

# Add the project to the container
COPY resources /python_app/
WORKDIR /python_app/

# Usage:
# docker build . -t <container name>:<version>
# docker run --rm -it <container name>:<version> /bin/bash
