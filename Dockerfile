FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install software-properties-common -y && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install git cron vim ansible -y

COPY . .

WORKDIR /ansible
USER root

RUN ansible -i /inventory --connection=local local -m ping

ENTRYPOINT [ "sh", "/docker-entrypoint.sh" ]
