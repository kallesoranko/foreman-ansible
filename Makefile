all: build run

.PHONY: build run

init:
	#echo "127.0.0.1" > /tmp/inventory
	echo "foreman.lab.local" > /tmp/inventory

build: 
	docker build -t foreman-ansible:latest .

run:
	# docker run --rm -p 80:80 -it foreman-ansible:latest bash
	sudo ansible-playbook ansible/foreman.yml -i /tmp/inventory -u root

enter:
	docker exec -it `docker ps -q -l` bash
