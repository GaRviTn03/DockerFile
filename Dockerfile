FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd
RUN curl -o /var/www/html/index.html http://www.google.com
RUN systemctl enable httpd
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

