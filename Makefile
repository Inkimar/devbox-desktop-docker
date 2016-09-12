PWD := $(shell pwd)
NAME := dina/openjdk-biobox:v0
XSOCK := /tmp/.X11-unix/X0

all: build up
	
build:
		@echo "check '/etc/default/docker ' "
		docker-compose build ui

debug:
		xhost +local:
		docker run --rm -it \
		-v $(XSOCK):$(XSOCK) -e DISPLAY=$${DISPLAY} \
		${NAME}

up:
	@echo "Launching Intellij"
	xhost +local:
	docker-compose up -d ui

clean: stop rm

stop:
		docker-compose stop

rm:
		docker-compose rm -vf

test:
		@echo "check '/etc/default/docker ' for the entry  DOCKER_OPTS=\" --dns <ip-1> --dns <ip-2>\" "
