FROM phusion/baseimage:latest
# Initially was based on work of Alessandro Viganò AND Andreas Löffler <andy@x86dev.com>
# Almost entierly rewrote by Abdelrani Djelaili
MAINTAINER Gissehel <public-dev-github-docker-seafile@gissehel.org>

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Seafile server" \
      org.label-schema.description="A simple to use seafile server" \
      org.label-schema.license="MIT" \
      org.label-schema.vendor="gissehel" \
      org.label-schema.url="https://github.com/gissehel/docker-seafile" \
      org.label-schema.vcs-url="https://github.com/gissehel/docker-seafile" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc.1"

ADD files /tmp/files
RUN /bin/bash /tmp/files/build-script.sh

EXPOSE 8080 

