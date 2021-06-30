FROM jenkins/ssh-agent:jdk11

COPY setup_docker.sh /home
RUN  sh /home/setup_docker.sh

COPY daemon.json /etc/docker/
COPY docker_start.sh /home

ENTRYPOINT ["/home/docker_start.sh"]

