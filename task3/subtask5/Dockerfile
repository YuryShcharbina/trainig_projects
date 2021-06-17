FROM tomcat

RUN  apt-get update && apt-get install -y  postgresql-client-11
COPY wait-for-it.sh ./

CMD ["./wait-for-it.sh"]
