FROM ubuntu:14.04
MAINTAINER Jechiy <773372347@qq.com>
WORKDIR /
RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /usr/share/nginx/html/html5-mario.zip -L https://dn-downfile.qbox.me/html5-mario.zip
RUN cd /usr/share/nginx/html/ && unzip html5-mario.zip && mv blog/* . && rm -rf blog html5-mario.zip

EXPOSE 80
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
