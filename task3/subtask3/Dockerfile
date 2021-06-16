FROM debian

RUN apt-get update && apt-get install -y apache2
COPY index.html /var/www/html/
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
RUN  echo "ServerName localhost" >> /etc/apache2/apache2.conf
ENV DEVOPS=master
RUN mkdir /app/
COPY update_html.sh /app/
RUN chmod +x /app/update_html.sh
ENV TZ Europe/Moskow
EXPOSE 80

CMD ["/app/update_html.sh"]


