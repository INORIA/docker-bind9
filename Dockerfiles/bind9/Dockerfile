FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install bind9
RUN apt-get update && apt-get install -y bind9
VOLUME ["/etc/bind"]
EXPOSE 53 53/udp

# Launch bind9
RUN mkdir /etc/service/bind9
ADD services/bind9.sh /etc/service/bind9/run

# enable SSH
ENV SSH_DIR ./sshkeys
ADD ${SSH_DIR}/key.pub /tmp/key.pub
RUN cat /tmp/key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/key.pub
RUN rm -f /etc/service/sshd/down
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

