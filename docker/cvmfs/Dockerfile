FROM hepsw/cvmfs-cms


VOLUME /code
WORKDIR /code

RUN yum update -y -q --exclude=kernel* && \
  yum install -y -q \
  expat-devel \
  git \
  glibc-devel \
  mesa-libGLU-devel \
  patch \
  python-pip \
  libpng \
  libjpeg \
  libSM-devel \
  libXft \
  libXmu-devel \
  sudo \
  wget && \
  yum clean all

ENV CONDA_INSTALL_PATH=/software/conda
ENV PATH=${CONDA_INSTALL_PATH}/bin:$PATH
COPY docker/install_conda.sh /tmp/install_conda.sh
COPY requirements.txt /tmp/requirements.txt
RUN source /tmp/install_conda.sh

COPY scripts/cdw /usr/local/bin/cdw
COPY scripts/execute_with_metrics /usr/local/bin/execute_with_metrics


ARG USERID=1000
ENV USERNAME sonic
RUN adduser -u ${USERID} ${USERNAME} && \
  echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} && \
  chmod 0440 /etc/sudoers.d/${USERNAME} && \
  cp -p /root/.bashrc /home/${USERNAME}/. && \
  chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.bashrc

USER ${USERNAME}
ENV HOME /home/${USERNAME}

ENTRYPOINT sudo /usr/bin/cubied && \
  echo "Starting F.A.S.T. container" && \
  tail -f /dev/null
