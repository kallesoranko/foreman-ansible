all: build run

.PHONY: build run

build: 
	docker build -t foreman-ansible:latest .

run:
	docker run --rm -p 80:80 -it foreman-ansible:latest bash

enter:
	docker exec -it `docker ps -q -l` bash
