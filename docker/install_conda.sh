#!/usr/bin/env bash
mkdir -p ${CONDA_INSTALL_PATH}; rmdir ${CONDA_INSTALL_PATH}
wget -nv \
      https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
      -O /tmp/miniconda.sh
bash /tmp/miniconda.sh -b -p ${CONDA_INSTALL_PATH}
rm -f /tmp/miniconda.sh
echo "Finished conda installation, updating packages"
conda config --add channels conda-forge
conda config --add channels nlesc
conda config --set show_channel_urls yes
conda update conda -y
conda update pip -y
conda install psutil -y
echo "Finished updating packages, creating new conda environment"
# create new conda environment with Python 2.7 and ROOT 6
conda create -n fast python=2.7 -y
echo "Created conda environment, installing basic dependencies"
source activate fast
# install python packages
pip install -U -r /tmp/requirements.txt
conda clean -t -y
