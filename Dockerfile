FROM centos:7.0.1406
COPY CentOS-Base.repo /etc/yum.repos.d/
RUN yum -y install java-1.7.0-openjdk-headless openssh-server sudo
RUN useradd -G wheel -d /jenkins -m jenkins
RUN echo 'jenkins ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN mkdir /jenkins/.ssh
COPY authorized_keys /jenkins/.ssh/
RUN chown -R jenkins:jenkins /jenkins/.ssh
RUN chmod 700 /jenkins/.ssh
RUN chmod 600 /jenkins/.ssh/authorized_keys
