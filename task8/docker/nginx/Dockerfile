FROM nginx:1.20.1-alpine

ARG DJANGO_HOST_ADDRESS

RUN rm /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/app.conf.template /etc/nginx/templates/app.conf.template
