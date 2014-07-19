FROM phusion/baseimage:0.9.11
MAINTAINER gfjardim <gfjardim@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN usermod -u 99 nobody && \
    usermod -g 100 nobody && \
    usermod -d /home nobody

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

ADD sources.list /etc/apt/

RUN apt-get update -qq && \
    apt-get install -qq --force-yes python wget && \
    apt-get autoremove && \
    apt-get autoclean


VOLUME /config
VOLUME /dropbox

RUN chown nobody:users /home && \
    ln -sf /config /home/.dropbox && \
    ln -sf /dropbox /home/Dropbox

RUN mkdir -p /opt/dropbox && wget -nv -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar -xzf - --strip-components=1 -C /opt/dropbox

EXPOSE 17500

# Add Dropbox to runit
RUN mkdir /etc/service/dropbox
ADD dropbox.sh /etc/service/dropbox/run
RUN chmod +x /etc/service/dropbox/run
