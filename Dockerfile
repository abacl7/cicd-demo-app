FROM centos:7.2.1511

MAINTAINER abacl7@github

RUN yum install -y httpd python

RUN sed -ri 's/Options Indexes FollowSymLinks/Options Indexes FollowSymLinks ExecCGI/g; \
             s/#AddHandler cgi-script .cgi/AddHandler cgi-script .pl .cgi/g' /etc/httpd/conf/httpd.conf

COPY test.cgi /var/www/cgi-bin/

RUN chmod +x /var/www/cgi-bin/test.cgi

COPY httpd-foreground /usr/local/bin/

RUN chmod +x /usr/local/bin/httpd-foreground

EXPOSE 80
CMD ["httpd-foreground"]
