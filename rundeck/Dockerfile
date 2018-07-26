FROM centos

RUN yum install -y wget unzip less tree vim

# Get Rundeck repo
RUN wget https://bintray.com/rundeck/rundeck-rpm/rpm -O bintray.repo
RUN mv bintray.repo /etc/yum.repos.d/
RUN rpm -Uvh http://repo.rundeck.org/latest.rpm

# Install Rundeck
RUN yum install -y java-1.8.0 rundeck rundeck-cli

# Get Packer and Terraform
RUN wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip
RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip

# Unpack packer and terraform
RUN unzip packer_1.2.5_linux_amd64.zip -d /usr/bin/
RUN unzip terraform_0.11.7_linux_amd64.zip -d /usr/bin/

# Make necessary directory structure
RUN mkdir -p /var/rundeck/projects/Info/acls
RUN mkdir -p /var/rundeck/projects/Info/etc
RUN mkdir -p /var/rundeck/DEPLOYMENTS/MENU_ITEMS
RUN mkdir /home/terraform

#Copy file
COPY project.properties /var/rundeck/projects/Info/etc/
COPY resources.xml /var/rundeck/projects/Info/etc/
COPY PROJECT_ID.json /var/rundeck/DEPLOYMENTS/MENU_ITEMS/
COPY APPLICATIONS.json /var/rundeck/DEPLOYMENTS/MENU_ITEMS/
COPY PROVIDER.json /var/rundeck/DEPLOYMENTS/MENU_ITEMS/
COPY ACTION.json /var/rundeck/DEPLOYMENTS/MENU_ITEMS/
ADD ./terraform /home/terraform

# Start rundeck


# Prepare job
COPY terraform-job.xml /home/terraform/
RUN /etc/init.d/rundeckd start && echo "Waiting for rundeck !" && sleep 60 && export RD_URL=http://127.0.0.1:4440 && export RD_USER=admin && export RD_PASSWORD=admin && export RD_PROJECT=Info && rd jobs load -f /home/terraform/terraform-job.xml -p Info

EXPOSE 4440
