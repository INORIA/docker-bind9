FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install bind9
RUN apt-get update && apt-get install -y bind9
VOLUME ["/etc/bind"]
EXPOSE 53 53/udp

# Launch bind9
RUN mkdir /etc/service/bind9
ADD /runit_bind9.sh /etc/service/bind9/run

# enable SSH
ADD /ssh.pub /tmp/ssh.pub
RUN cat /tmp/ssh.pub >> /root/.ssh/authorized_keys && rm -f /tmp/ssh.pub
RUN rm -f /etc/service/sshd/down
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

