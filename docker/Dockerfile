FROM rootproject/root-ubuntu16
LABEL maintainer="kreczko@cern.ch"

ENV PYTHONPATH /usr/local/lib/root

RUN sudo apt update && \
    sudo apt install -y python-pip

RUN pip install --user -U --no-cache-dir numpy pandas root_numpy root_pandas rootpy

COPY docker/cdw /usr/local/bin/cdw


CMD ['/usr/local/bin/cdw']
