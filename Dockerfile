FROM python:3
ENV PYTHONBUFFERED 1
RUN mkdir /code
WORKDIR  /code
COPY requirements.txt /code
RUN apt-get update -y &&\
    apt-get install libgdal-dev -y &&\
    export CPLUS_INCLUDE_PATH=/usr/include/gdal &&\
    export C_INCLUDE_PATH=/usr/include/gdal
RUN pip install -r requirements.txt
COPY . /code/
