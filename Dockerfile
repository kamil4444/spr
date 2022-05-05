FROM alpine:latest
LABEL maintainer="Kamil Rytel"
ENV PHPVERSION=7
RUN apk add --update apache2 php${PHPVERSION}-apache2 php${PHPVERSION} && \ 
rm -rf /var/cache/apk/* && \
mkdir /run/apache/ && \
rm -rf /var/www/localhost/htdocs/index.html
COPY index.php /var/www/localhost/htdocs/index.php
RUN chmod 755 /var/www/localhost/htdocs/index.php && \
echo "Port 80, Kamil Rytel"
EXPOSE 80/tcp
ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]

