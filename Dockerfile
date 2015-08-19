FROM rhel7

MAINTAINER Christoph Görn <goern@redhat.com>

LABEL Vendor="Red Hat" 
LABEL License="GPLv2"
LABEL Version="0.1.0"
LABEL Architecture="x86_64"

LABEL RUN /usr/bin/docker run --rm --tty osbs-cli

# set up the repos so that we can get what we need
RUN yum install yum-utils -y && \
    yum-config-manager --disable \* && \
    yum-config-manager --enable rhel-7-server-rpms --enable rhel-7-server-extras-rpms --enable rhel-7-server-optional-rpms && \
    yum install rh-osbs && \
    yum erase -y yum-utils python-kitchen python-chardet

ADD osbs.conf /etc/osbs.conf

ENTRYPOINT [ "osbs" ]
CMD [ "--use-kerberos" ]
