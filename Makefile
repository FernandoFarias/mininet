DOCKER ?= /usr/bin/docker 
IMAGE_NAME ?= fernnf/mininet
CONTAINER_NAME ?= mininet
NO_DOCKER_CACHE ?= false

build:
	sudo ${DOCKER} build --no-cache=${NO_DOCKER_CACHE} $ --rm=true -t ${IMAGE_NAME} .
run:
	sudo ${DOCKER} run -d --privileged=true -h mininet -P -p 8022:22 -v ~/data/mininet:/data --name ${CONTAINER_NAME} ${IMAGE_NAME} 
stop:
	sudo ${DOCKER} stop ${CONTAINER_NAME}
start:
	sudo ${DOCKER} start ${CONTAINER_NAME}
rm: 
	sudo ${DOCKER} rm ${CONTAINER_NAME}
rmi: 
	sudo ${DOCKER} rmi ${IMAGE_NAME}
all:
	build