FROM rhel7
MAINTAINER Christoph Görn <cgoern@redhat.com>

LABEL Vendor="Red Hat" License=GPLv2
LABEL Version=0.0.1

LABEL INSTALL="docker run --rm --privileged -v /:/host -e HOST=/host -e LOGDIR=${LOGDIR} -e CONFDIR=${CONFDIR} -e DATADIR=${DATADIR} -e IMAGE=IMAGE -e NAME=NAME IMAGE /bin/install.sh"
LABEL RUN /usr/bin/docker run --rm osbs-cli 
LABEL UNINSTALL="docker run --rm --privileged -v /:/host -e HOST=/host -e IMAGE=IMAGE -e NAME=NAME IMAGE /bin/uninstall.sh"
ADD scripts /

RUN yum --disablerepo=rhel-7-server-eus-rpms --disablerepo=rhel-7-server-htb-rpms install -y python-requests git
RUN git clone http://git.engineering.redhat.com/git/users/ttomecek/osbs-min.git /opt/osbs

WORKDIR /opt/osbs
ENTRYPOINT [ "/usr/bin/python2.7", "/opt/osbs/osbs.py" ]

