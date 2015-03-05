FROM rhel7
MAINTAINER Christoph Görn <cgoern@redhat.com>

RUN yum --disablerepo=rhel-7-server-eus-rpms --disablerepo=rhel-7-server-htb-rpms install -y python-requests git
RUN git clone http://git.engineering.redhat.com/git/users/ttomecek/osbs-min.git /opt/osbs

WORKDIR /opt/osbs
ENTRYPOINT [ "/usr/bin/python2.7", "/opt/osbs/osbs.py" ]

