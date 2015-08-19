FROM fedora:22 

MAINTAINER Christoph Görn <goern@b4mad.net>

LABEL License="GPLv2" \
      Version="0.1.0" \
      Architecture="x86_64"

# set up the repos so that we can get what we need
RUN dnf install --setopt=tsflags=nodocs -y osbs && \
    dnf update -y --setopt=tsflags=nodocs && \
    dnf clean all

ADD osbs.conf /etc/osbs.conf

ENTRYPOINT [ "osbs" ]
CMD [ "--use-kerberos" ]
