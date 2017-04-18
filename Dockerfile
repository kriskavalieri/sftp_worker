FROM ubuntu:14.04
RUN apt-get update -qq -y && apt-get install -qq -y nginx openssh-server
COPY run_servers.sh /run_servers.sh
COPY nginx.conf /var/nginx.conf
COPY default /etc/nginx/sites-enabled/
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd
RUN echo "root:root"|chpasswd
RUN sed -i 's|session.*required.*pam_loginuid.so|session optional pam_loginuid.so|' /etc/pam.d/sshd
RUN echo LANG="en_US.UTF-8" > /etc/default/locale
EXPOSE 22/tcp 80/tcp
CMD ["bash", "/run_servers.sh"]
