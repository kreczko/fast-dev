FROM rootproject/root-ubuntu16
LABEL maintainer="kreczko@cern.ch"

ENV PYTHONPATH /usr/local/lib/root

VOLUME /code
WORKDIR /code

USER root
RUN apt update -qq && \
    apt install -yq python-pip

RUN pip install -U pip && \
    pip install -U --no-cache-dir \
      setuptools \
      numpy \
      pandas \
      root_numpy \
      root_pandas \
      rootpy \
      uproot

COPY scripts/cdw /usr/local/bin/cdw

ARG USERID=1000
ENV USERNAME sonic
RUN adduser -u ${USERID} ${USERNAME} && \
  echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} && \
  chmod 0440 /etc/sudoers.d/${USERNAME} && \
  cp -p /root/.bashrc /home/${USERNAME}/. && \
  chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.bashrc

USER ${USERNAME}
ENV HOME /home/${USERNAME}

CMD ['/usr/local/bin/cdw']
