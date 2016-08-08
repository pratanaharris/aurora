FROM centos:6

# Install Ansible
RUN yum -y install epel-release
RUN yum -y install git ansible sudo
RUN yum clean all

# Disable requiretty
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Install Ansible inventory file
RUN echo -e '[admin_terminal]\nlocalhost ansible_connection=local' > /etc/ansible/hosts
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]