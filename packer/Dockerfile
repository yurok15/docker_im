FROM centos

RUN yum install -y wget unzip vim openssh openssh-server openssh-clients openssl-libs less
RUN wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip
RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
RUN unzip packer_1.2.5_linux_amd64.zip -d /usr/bin/
RUN unzip terraform_0.11.7_linux_amd64.zip -d /usr/bin/
RUN echo "root:privetserver" | chpasswd
RUN ssh-keygen -A
RUN systemctl enable sshd.service
RUN mkdir /var/run/sshd
COPY sshd_config /etc/ssh/
RUN mkdir -p /root/.ssh

RUN mkdir /home/terraform
ADD ./terraform /home/terraform

EXPOSE 22

#ENTRYPOINT /usr/sbin/sshd -f /etc/ssh/sshd_config -D
