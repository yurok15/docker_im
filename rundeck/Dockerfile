FROM centos

COPY hosts /etc/hosts
RUN wget https://bintray.com/rundeck/rundeck-rpm/rpm -O bintray.repo
RUN mv bintray.repo /etc/yum.repos.d/
RUN rpm -Uvh http://repo.rundeck.org/latest.rpm
RUN yum install -y java-1.8.0 rundeck vim iproute openssh-clients telnet sshpass
RUN yum install -y openssh-clients telnet sshpass wget rundeck-cli

RUN wget https://github.com/jameshcoppens/rundeck-gcp-nodes-plugin/releases/download/V0.1.1-BETA/rundeck-gcp-nodes-plugin-0.1.1-BETA.jar
RUN mv rundeck-gcp-nodes-plugin-0.1.1-BETA.jar /var/lib/rundeck/libext/
RUN mkdir -p /var/rundeck/projects/Info/acls
RUN mkdir -p /var/rundeck/projects/Info/etc
COPY project.properties /var/rundeck/projects/Info/etc/
COPY resources.xml /var/rundeck/projects/Info/etc/

#RUN mkdir -p /var/lib/rundeck/.ssh/ # need to-be removed

RUN rm -f /root/.ssh/id_rsa*
RUN ssh-keygen -f /root/.ssh/id_rsa -q -N ""
RUN cat /root/.ssh/id_rsa.pub > /var/lib/rundeck/.ssh/id_rsa.pub
RUN cat /root/.ssh/id_rsa > /var/lib/rundeck/.ssh/id_rsa

RUN chmod 600 /var/lib/rundeck/.ssh/id_rsa
RUN chmod 644 /var/lib/rundeck/.ssh/id_rsa.pub
RUN chown -R rundeck:rundeck /var/lib/rundeck/.ssh
RUN sshpass -p privetserver ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostKeyChecking=no root@172.17.0.3


EXPOSE 4440
