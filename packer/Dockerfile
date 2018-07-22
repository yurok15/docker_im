FROM centos

RUN yum install -y wget unzip vim openssh openssh-server openssh-clients openssl-libs
RUN wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip
RUN unzip packer_1.2.5_linux_amd64.zip -d /usr/bin/
RUN echo "root:privetserver" | chpasswd
RUN ssh-keygen -A
RUN systemctl enable sshd.service
RUN mkdir /var/run/sshd
COPY sshd_config /etc/ssh/
CMD ["/etc/init.d/sshd", "start"]

RUN mkdir -p /root/.ssh
#COPY authorized_keys /root/.ssh/authorized_keys
#RUN chmod 700 /root/.ssh
#RUN chmod 600 /root/.ssh/authorized_keys


EXPOSE 22

ENTRYPOINT /usr/sbin/sshd -f /etc/ssh/sshd_config -D
