FROM postgres

RUN apt update && apt install -y net-tools
COPY ./docker/postgresql/init_django_user.sh /docker-entrypoint-initdb.d/
