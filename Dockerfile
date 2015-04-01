FROM rhel7
MAINTAINER Christoph Görn <goern@redhat.com>

LABEL Vendor="Red Hat" License=GPLv2
LABEL Version=0.0.2

LABEL RUN /usr/bin/docker run --rm osbs-cli
LABEL UNINSTALL /usr/bin/docker run -t -i --rm --privileged -v /:/host --net=host --ipc=host --pid=host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE -v ${CONFDIR}:/etc/NAME -v ${LOGDIR}:/var/log/NAME -v ${DATADIR}:/var/lib/NAME -e CONFDIR=${CONFDIR} -e LOGDIR=${LOGDIR} -e DATADIR=${DATADIR} --name NAME IMAGE /uninstall.sh

# to intall some software...
RUN yum --disablerepo=rhel-7-server-eus-rpms --disablerepo=rhel-7-server-htb-rpms install -y python-requests git
RUN git clone http://git.engineering.redhat.com/git/users/ttomecek/osbs-min.git /opt/osbs

# for the (un)install scripts
ADD scripts /opt/osbs/

WORKDIR /opt/osbs
ENTRYPOINT [ "/usr/bin/python2.7", "/opt/osbs/osbs.py", "--server", "https://se-docker-builder.syseng.bos.redhat.com", "--server-port", "8443" ]

