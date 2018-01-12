# fast-dev
The fast-dev project is meant to simplify the software development process in HEP.
Via the use of Docker it allows to develop HEP code on any Linux or OS X machine,
without the need to log onto any cluster. This allows you to use any editor or
Integrated Development Environment (IDE) you wish.

In some cases this solution can also work without network, but this strongly
depends on the underlying CVMFS usage and if all projects have already been
checked out. For CVMFS, all software is cached locally as defined by the
`CVMFS_TMP_DIR` environmental variable (defined in `setup.sh`), but it needs
to have been accessed at least once before it can be used offline.


# General use
The following recipe works on Linux and OS X.
1. [Install docker](https://docs.docker.com/engine/installation/)
2. Install docker python bindings and docker-compose: `pip install --user docker docker-compose`
3. Clone repo and start container

```bash
git clone https://github.com/kreczko/fast-dev.git
cd fast-dev
source setup.sh
# only the first time to download base image
docker-compose pull
# only the first time to set permissions specific to your machine
docker-compose build
# start container
docker-compose up -d cvmfs
# connect to container
docker exec -ti fastdev_cvmfs_1 cdw
# To stop container once your are done
docker-compose down
```
For more information on `docker-compose` commands please see `docker-compose -h`.

## Inside the container
When starting the container you will be placed into `/code` which maps the location
defined in `DEV_DIR` (default is `fast-dev/dev`). This way the code is available
inside as well as outside the container.

# Authentication
The container will load your SSH keys, grid certificates, and git config from their
default locations. Make sure they are up-to-date.

# Missing software
The provided container provides a python 2.7 development area with everything
else loaded from CVMFS. Should something be missing, please submit a software
request in https://github.com/kreczko/fast-dev/issues.
As a temporary solution you can use `sudo yum install <X>`, `sudo pip install <X>`
or `sudo conda install <X>` to install the required software.

# Known issues
On OS X the SSH config (`~/.ssh/config`) might contain lines that are incompatible
with Scientific Linux 6. You might have to comment them out in order to make it
work.
